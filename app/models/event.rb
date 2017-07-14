class Event < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'

  validates_presence_of :title, :location, :date, :creator_id
end
