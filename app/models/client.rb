class Client < ActiveRecord::Base
  default_scope :order => 'updated_at DESC'
  belongs_to :user
  has_many :demands
  has_many :events
  
  attr_accessible :user_id, :address, :cif, :name,:email 
end
