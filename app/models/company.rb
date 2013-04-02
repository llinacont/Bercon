class Company < ActiveRecord::Base
  attr_accessible :id, :image, :name, :user_id
  has_many :users
  has_many :events
end
