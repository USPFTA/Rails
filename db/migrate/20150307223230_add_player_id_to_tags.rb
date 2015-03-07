class AddPlayerIdToTags < ActiveRecord::Migration
  def change
    add_column :tags, :player_id, :integer
  end
end
