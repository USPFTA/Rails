class AddNameToFlag < ActiveRecord::Migration
  def change
    add_column :flags, :name, :string, default: "Find me!"
  end
end
