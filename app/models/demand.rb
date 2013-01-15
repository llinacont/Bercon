class Demand < ActiveRecord::Base
  belongs_to :client
  has_many :line_items, :dependent => :destroy
  attr_accessible :client_id
end
