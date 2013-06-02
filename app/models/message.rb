class Message < ActiveRecord::Base

  attr_accessible :receiver, :sender_id, :text
end
