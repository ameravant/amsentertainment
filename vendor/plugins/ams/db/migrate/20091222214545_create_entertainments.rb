class CreateEntertainments < ActiveRecord::Migration
  def self.up
    create_table :entertainments do |t|
      t.string :title, :permalink
      t.integer :images_count, :default => 0
      t.integer :assets_count, :default => 0
      t.text :body, :blurb
      t.string :meta_description
      t.timestamps
    end
  end

  def self.down
    drop_table :entertainments
  end
end
  