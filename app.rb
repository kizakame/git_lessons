require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require 'open-uri'
require 'nokogiri'
require 'sinatra/activerecord'
require './models'
require 'gmail'
require 'date'
require 'time'
# if development?
require "./show_table_action"
# end
require 'tzinfo/data'

  # USERNAME = "timecapusler"
  # PASSWORD = "mjxbdlilzmukgmrm"
 def send_message(mail_address, mail_subject, mail_body)
  gmail = Gmail.new("timecapusler","mjxbdlilzmukgmrm")
  message =
   gmail.generate_message do
    to mail_address
    subject mail_subject
    html_part do
     content_type "text/html; charset=UTF-8"
     body mail_body
    end
   end
   gmail.deliver(message)
   gmail.logout
 end



get '/' do
 erb :log_in
end

post '/form' do

  @email = params[:email]
  @time = params[:time]
  @message = params[:message]
  @subject = params[:subject]
  @date = params[:date]
  @from = params[:from]


 erb :form
end

post '/check' do
 # History.create!(
 #  email: params[:email],
 #  time: params[:time],
 #  message: params[:message]
 #  )
  @email = params[:email]
  @time = params[:time]
  @message = params[:message]
  @subject = params[:subject]
  @date = params[:date]
  @from = params[:from]
  erb :check


end

post '/edit' do
  @email = params[:email]
  @time = params[:time]
  @message = params[:message]
  @subject = params[:subject]
  @date = params[:date]
  @from = params[:from]

  erb :edit
 end



post '/after' do
 # send_message(@email,@subject,@message)
  @email = params[:email]
  @time = params[:time]
  @message = params[:message]
  @subject = params[:subject]
  @date = params[:date]
  @from = params[:from]


  Time.zone = "Tokyo"
  @japantime = Time.zone.parse(@date + " " + @time + ":00")

 # @history = History.create!(email: params[:email],time: params[:time],message: params[:message],subject: params[:subject])
 history = History.create!(email: params[:email],time: params[:time],message: params[:message],subject: params[:subject],status:0,date: params[:date],from: params[:from],japantime: @japantime)
 history.save!
 erb :after
end

get '/send' do
#  # histories = History.where('time<=?', Time.new.strftime("%Y-%m-%dT%H:%M")).where({status:0})
#  @nowtime = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")

 histories = History.where('japantime<=?', DateTime.now.strftime("%Y-%m-%d %H:%M:%S")).where({status:0})

 # @try = Time.new.strftime("%Y-%m-%dT%H:%M")
 histories.each do |history|
  if history.email.present?
  send_message(history.email,history.subject,history.message)
  history.status=1
  history.save
  end
 end
erb :debug
end


post '/' do
 redirect "/"
end

post '/form' do
 redirect "/form"
end
