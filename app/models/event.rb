class Event < ActiveRecord::Base
  attr_accessible :company_id, :object_id, :type_mask
  belongs_to :user
end
