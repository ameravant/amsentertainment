class CreateArtistTypes < ActiveRecord::Migration
  def self.up
    create_table :artist_types do |t| 
      t.string :title
    end
  end

  def self.down
    drop_table :artist_types
  end
end
