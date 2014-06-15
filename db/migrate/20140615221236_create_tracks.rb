class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :artist_id
      t.integer :sc_id
      t.integer :duration
      t.string :sc_permalink_uri
      t.boolean :sc_streamable
      t.string :sc_embeddable_by
      t.string :sc_genre
      t.string :sc_title
      t.string :title
      t.string :sc_artwork_url
      t.string :sc_stream_url
      t.integer :sc_playback_count
      t.integer :sc_favoritings_count

      t.timestamps
    end
  end
end
