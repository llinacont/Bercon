class UserMailer < ActionMailer::Base
  default from: "noReply@example.com"
  
  def welcome_email(user)
    @user = user
    @url  = "http://localhost:3000/users/sign_in"
    mail(:to => user.email, :subject => "Welcome to Bercon")
  end
  
  def welcome_to_company_email(user)
    @user = user
    @company  = @user.company
    mail(:to => user.email, :subject => "Welcome to " + @company.name )
  end
  
end
