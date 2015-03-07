class ChangeLatLongPrecision < ActiveRecord::Migration
  def change
    change_column :games, :center_lat, :decimal, :precision => 12, :scale => 10
    change_column :games, :center_long, :decimal, :precision => 12, :scale => 10
  end
end
