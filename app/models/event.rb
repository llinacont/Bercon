class Event < ActiveRecord::Base
  attr_accessible :company_id, :user_id, :type_mask
  belongs_to :user
end
