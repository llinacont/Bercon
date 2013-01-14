class Client < ActiveRecord::Base
  belongs_to :user
  has_many :demands
  
  attr_accessible :user_id, :address, :cif, :name
end
