class TestimonialsCountAdd < ActiveRecord::Migration
  def self.up
    add_column :artists, :testimonials_count, :integer, :default => 0
    add_column :entertainments, :testimonials_count, :integer, :default => 0
  end

  def self.down
    remove_column :entertainments, :testimonials_count
    remove_column :artists, :testimonials_count
  end
end
