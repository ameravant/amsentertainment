class AddRightColumn < ActiveRecord::Migration
  def self.up
    add_column :pages, :right_column, :text
  end

  def self.down
    remove_column :pages, :right_column
  end
end
