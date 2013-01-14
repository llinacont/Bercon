class Demand < ActiveRecord::Base
  belongs_to :clients
  
  belongs_to :products
 
  attr_accessible :client_id, :product_id, :quantity
end
