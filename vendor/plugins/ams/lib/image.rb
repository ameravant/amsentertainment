class Image < ActiveRecord::Base
  require "#{RAILS_ROOT}/vendor/plugins/siteninja/siteninja_core/app/models/image.rb"
  has_attached_file :image, :styles => { :icon => "32x16>", :thumb => "48x36#", :small => "85x55#", :medium => "200x9999>", :large => "880x9999>", :slide => "550x300#", :narrow_slide => "470x264#" }
  has_attached_file :featured_image, :styles => { :thumb => "48x36#", :small => "85x55#", :medium => "200x142#", :slide => "550x9999>", :narrow_slide => "470x9999>" }
  has_attached_file :thumb_image, :styles => { :thumb => "48x36#", :small => "85x55#", :medium => "200x142#" }
end

