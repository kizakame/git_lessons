class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.string :email
      t.string :time
      t.text :message
      t.timestamps null: false
    end
  end
end
