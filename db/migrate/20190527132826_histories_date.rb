class HistoriesDate < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :date, :date
  end
end
