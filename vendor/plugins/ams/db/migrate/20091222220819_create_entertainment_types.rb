class CreateEntertainmentTypes < ActiveRecord::Migration
  def self.up
    create_table :entertainment_types, :force => true do |t|
      t.string :title
    end
  end

  def self.down
    drop_table :entertainment_types
  end
end
