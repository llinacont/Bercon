class LineItem < ActiveRecord::Base
  belongs_to :products
  belongs_to :demands
  
  validates  :product_id, :presence => true
  validates  :demand_id, :presence => true
  
  attr_accessible :demand_id, :product_id, :quantity
end
