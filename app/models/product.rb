class Product < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :description, :image_url, :price, :title
end
