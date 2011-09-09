class CreateArtists < ActiveRecord::Migration
  def self.up
    create_table :artists do |t|
      t.string :title, :permalink
      t.integer :price
      t.integer :images_count, :default => 0
      t.integer :assets_count, :default => 0
      t.text :body, :blurb
      t.timestamps
    end
  end

  def self.down
    drop_table :artists
  end
end
