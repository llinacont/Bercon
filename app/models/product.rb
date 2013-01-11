class Product < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :image_url, :price, :title
end
