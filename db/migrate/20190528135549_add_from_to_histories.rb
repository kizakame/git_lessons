class AddFromToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :from, :text
    change_column :histories, :time, :time
    change_column :histories, :date, :date
  end
end
