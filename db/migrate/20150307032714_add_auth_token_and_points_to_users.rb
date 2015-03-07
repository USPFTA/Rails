class AddAuthTokenAndPointsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :authentication_token, :string
    add_index :users, :authentication_token
    add_column :users, :total_points, :integer, default: 0
  end
end
