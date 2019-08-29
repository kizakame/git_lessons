class ChangeDateOfJapantime < ActiveRecord::Migration[5.2]
  def change
     change_column :histories, :japantime, :timestamp
  end
end
