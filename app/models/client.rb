class Client < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :address, :cif, :name
end
