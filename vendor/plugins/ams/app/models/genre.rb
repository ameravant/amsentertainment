class Genre < ActiveRecord::Base
has_permalink :title
has_and_belongs_to_many :artists
validates_presence_of :title

def to_param
  self.permalink
end

end
