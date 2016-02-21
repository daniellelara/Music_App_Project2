class CreateUsersTracksTable < ActiveRecord::Migration
  def change
    create_join_table :users, :tracks 
  end
end
