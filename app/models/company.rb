class Company < ActiveRecord::Base
  attr_accessible :image, :name, :user_id
  has_many :users
  has_many :events
end
