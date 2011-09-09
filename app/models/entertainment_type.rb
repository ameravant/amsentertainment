class EntertainmentType < ActiveRecord::Base
has_permalink :title
has_and_belongs_to_many :entertainments
validates_presence_of :title
validates_uniqueness_of :title, :on => :create, :message => "must be unique"

def to_param
  self.permalink
end

end
