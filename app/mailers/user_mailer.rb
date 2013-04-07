class UserMailer < ActionMailer::Base
  default from: "The MSFT401k Team <team@MSFT401k.com>"

  def welcome_email(user)
    @user = user
    @url  = "http://www.MSFT401k.com"
    mail(:to => user.email, :subject => "Welcome to MSFT401k!")
  end
end
