class Genre < ActiveRecord::Base

has_and_belongs_to_many :artists
validates_presence_of :title

end
