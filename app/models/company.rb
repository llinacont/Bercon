class Company < ActiveRecord::Base
  attr_accessible :image, :name
  has_many :users
end
