class EntertainmentTypesEntertainments < ActiveRecord::Migration
  def self.up
    create_table :entertainment_types_entertainments, :id => false do |t|
      t.references :entertainment, :entertainment_type
    end
  end

  def self.down
    drop_table :entertainment_types_entertainments
  end
end
