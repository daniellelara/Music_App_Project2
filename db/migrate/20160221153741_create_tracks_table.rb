class CreateTracksTable < ActiveRecord::Migration
  def change
      create_table :tracks do |t|
        t.string :title
        t.string :file
        t.string :artist
        t.string :genre
        t.string :image

        t.timestamps null: false
      end
    end
end
