class Addmetadescription < ActiveRecord::Migration
  def self.up
    add_column :artists, :meta_description, :string
  end

  def self.down
    remove_column :artists, :meta_description
  end
end
