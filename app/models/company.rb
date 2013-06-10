class Company < ActiveRecord::Base
  attr_accessible :id, :image, :name, :user_id, :cif
  has_many :users
  has_many :events
end
