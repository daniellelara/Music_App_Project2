class CreatePlaylistsTable < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :title
      t.string :genre
      t.string :image

      t.timestamps null: false
    end
  end
end
