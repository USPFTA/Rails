class AddDurationToGames < ActiveRecord::Migration
  def change
    add_column :games, :duration, :integer, default: 4
  end
end
