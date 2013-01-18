class Demand < ActiveRecord::Base
  belongs_to :client
  has_many :line_items, :dependent => :destroy
  attr_accessible :client_id, :update_at
  attr_accessor :update_at
end
