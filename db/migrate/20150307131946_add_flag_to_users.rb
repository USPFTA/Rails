class AddFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_flag, :integer
  end
end
