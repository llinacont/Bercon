class Client < ActiveRecord::Base
  default_scope :order => 'updated_at DESC'
  belongs_to :user
  has_many :demands
  
  attr_accessible :user_id, :address, :cif, :name
end
