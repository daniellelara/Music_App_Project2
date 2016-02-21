class CreateUsersPlaylistsTable < ActiveRecord::Migration
  def change
    create_join_table :users, :playlists
  end
end
