class EntertainmentType < ActiveRecord::Base
has_and_belongs_to_many :entertainments
validates_presence_of :title
validates_uniqueness_of :title, :on => :create, :message => "must be unique"
end
