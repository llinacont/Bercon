class Event < ActiveRecord::Base
  attr_accessible :type, :event_id
  has_and_belongs_to_many :users
end
