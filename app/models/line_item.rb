class LineItem < ActiveRecord::Base
  belongs_to :demand
  attr_accessible :demand_id, :product_id
end
