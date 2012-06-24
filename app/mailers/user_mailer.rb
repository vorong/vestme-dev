class UserMailer < ActionMailer::Base
  default from: "notifications@gvodev.info"

  def welcome_email(user)
    @user = user
    @url  = "http://gvodev.info"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
end
