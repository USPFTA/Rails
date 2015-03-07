class CreateGamesTable < ActiveRecord::Migration
  def change
    create_table :games_tables do |t|
      t.decimal :center_lat, precision: 8, scale: 6
      t.decimal :center_long, precision: 8, scale: 6
      t.decimal :radius, precision: 3, scale: 3
      t.timestamp :starts_at
      t.timestamp :ends_at
      t.integer :number_of_flags
    end
  end
end
