class Client < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address, :cif, :name
end
