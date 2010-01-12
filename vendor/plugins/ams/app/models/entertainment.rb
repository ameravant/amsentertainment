class Entertainment < ActiveRecord::Base
has_permalink :title
acts_as_taggable
has_many :assets, :as => :attachable, :dependent => :destroy
has_many :images, :as => :viewable, :dependent => :destroy
 
has_and_belongs_to_many :entertainment_types
validates_presence_of :title

def to_param
  "#{self.id}-#{self.permalink}"
end

end
