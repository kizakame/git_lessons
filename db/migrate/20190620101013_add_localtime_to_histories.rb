class AddLocaltimeToHistories < ActiveRecord::Migration[5.2]
  def change
     add_column :histories, :localtime, :datetime
  end
end
