require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require 'open-uri'
require 'nokogiri'
require 'sinatra/activerecord'
require './models'
require 'gmail'

  USERNAME = "matumatukame@gmail.com"
  PASSWORD = "00101013"
 def send_message(mail_address, mail_subject, mail_body)
  gmail = Gmail.new(USERNAME,PASSWORD)
  message = 
   gmail.generate_message do
    # to mail/address
    # subject mail_subject
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
 
get '/form' do
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

  erb :check
end

post '/after' do
 erb :after
 send_message(@email,@subject,@message)
 
end

post '/' do
 redirect "/"
end

post '/form' do
 redirect "/form"
end