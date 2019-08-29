class ChangeLocaltimeToJapantime < ActiveRecord::Migration[5.2]
  def change
    rename_column :histories, :localtime, :japantime
  end
end
