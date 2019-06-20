class ChangeDatatypeDateOfHistories < ActiveRecord::Migration[5.2]
  def change
    change_column :histories, :date, :time
  end
end
