class Demand < ActiveRecord::Base
  belongs_to :client 
  belongs_to :user
  has_many :line_items, :dependent => :destroy
  attr_accessible :client_id, :user_id
end
