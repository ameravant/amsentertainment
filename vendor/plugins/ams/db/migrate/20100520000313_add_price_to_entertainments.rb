class AddPriceToEntertainments < ActiveRecord::Migration
  def self.up
    add_column :entertainments, :price, :integer, :default => 0
  end

  def self.down
    remove_column :entertainments, :price
  end
end
