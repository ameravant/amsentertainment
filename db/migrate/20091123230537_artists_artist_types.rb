class ArtistsArtistTypes < ActiveRecord::Migration
  def self.up
    create_table :artist_types_artists, :id => false do |t| 
      t.integer :artist_id, :artist_type_id
    end
  end

  def self.down
    drop_table :artist_types_artists
  end
end
