class AddFeaturesCountToArtists < ActiveRecord::Migration
  def self.up
    add_column :entertainments, :features_count, :integer, :default => 0
    add_column :artists, :features_count, :integer, :default => 0
  end

  def self.down
    remove_column :entertainments, :features_count
    remove_column :artists, :features_count
  end
end
