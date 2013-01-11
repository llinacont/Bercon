class Client < ActiveRecord::Base
  attr_accessible :address, :cif, :name
end
