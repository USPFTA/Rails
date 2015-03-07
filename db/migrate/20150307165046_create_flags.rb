class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.float :flag_lat
      t.float :flag_long
      t.integer :player_id

      t.timestamps null: false
    end
  end
end
