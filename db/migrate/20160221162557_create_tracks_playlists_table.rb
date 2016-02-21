class CreateTracksPlaylistsTable < ActiveRecord::Migration
  def change
    create_join_table :tracks, :playlists
  end
end
