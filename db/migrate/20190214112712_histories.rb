class Histories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
    t.string :email
    t.datetime :time
    t.text :message
    t.text :subject
    t.timestamps null:false
  end
  end
end