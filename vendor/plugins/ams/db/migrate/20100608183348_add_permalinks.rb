class AddPermalinks < ActiveRecord::Migration
  def self.up
    add_column :artist_types, :permalink, :string 
    add_column :genres, :permalink, :string
    add_column :entertainment_types, :permalink, :string
  end

  def self.down
    remove_column :entertainment_types, :permalink
    remove_column :genres, :permalink
    remove_column :artist_types, :permalink
  end
end
