class LineItem < ActiveRecord::Base
  belongs_to :products
  belongs_to :demands
  attr_accessible :demand_id, :product_id, :quantity
end
