class Message < ActiveRecord::Base
<<<<<<< HEAD

  is_private_message
  
  # The :to accessor is used by the scaffolding,
  # uncomment it if using it or you can remove it if not
  attr_accessor :to
  
end
=======
  attr_accessible :receiver, :sender_id, :text
end
>>>>>>> FETCH_HEAD
