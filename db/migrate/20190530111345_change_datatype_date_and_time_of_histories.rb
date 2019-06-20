class ChangeDatatypeDateAndTimeOfHistories < ActiveRecord::Migration[5.2]
  def change
    change_column :histories, :date, :string
    change_column :histories, :time, :string
  end
end
