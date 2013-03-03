class UserMailer < ActionMailer::Base
  default from: "team@msft401k.com"

  def welcome_email(user)
    @user = user
    @url  = "http://www.msft401k.com"
    mail(:to => user.email, :subject => "Welcome to msft401k!")
  end
end
