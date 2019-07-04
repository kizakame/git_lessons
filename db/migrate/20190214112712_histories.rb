class Histories < ActiveRecord::Migration[5.2]
  validates :email,
  format: {with: /[@]/}
  def change
    create_table :histories do |t|
    t.string :email
    # t.datetime :time
    t.date :date
    t.time :time
    t.text :message
    t.text :subject
    t.timestamps null:false
  end
  end
  def self.up
  add_column :histories, :date, :date
  end

end