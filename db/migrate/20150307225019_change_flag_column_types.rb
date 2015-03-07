class ChangeFlagColumnTypes < ActiveRecord::Migration
  def change
    change_column :flags, :flag_lat, :decimal, :precision => 12, :scale => 10
    change_column :flags, :flag_long, :decimal, :precision => 12, :scale => 10
  end
end
