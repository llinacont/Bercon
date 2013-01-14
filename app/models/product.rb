class Product < ActiveRecord::Base
  belongs_to :user
  has_many :demands
  
  attr_accessible :user_id, :description, :image_url, :price, :title

end
