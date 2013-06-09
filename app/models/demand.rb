class Demand < ActiveRecord::Base
  belongs_to :client 
  belongs_to :user
  
  validates  :client_id, :presence => true
  validates  :user_id, :presence => true
  
  has_many :line_items, :dependent => :destroy
  attr_accessible :client_id, :user_id
end
