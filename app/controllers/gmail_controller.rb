class GmailController < ActionController::Base
  def index
    @gmail = Gmail.connect("angel.berenguel@gmail.com","mypassword")
    @rec = @gmail.inbox.mails()     
  end
end