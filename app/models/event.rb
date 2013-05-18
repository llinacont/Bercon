class Event < ActiveRecord::Base
  attr_accessible :company_id, :object_id, :type_mask
  
  belongs_to :user
  belongs_to :product
  belongs_to :client
  
  scope :recent, order('created_at DESC')
end
