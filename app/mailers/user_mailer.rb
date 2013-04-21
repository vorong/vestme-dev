class UserMailer < ActionMailer::Base
  default from: "The MSFT401k Team <team@MSFT401k.com>"

  def welcome_email(email)
    @url  = "http://www.MSFT401k.com"
    mail(:to => email, :subject => "Welcome to MSFT401k!")
  end

  def we_are_live_email(email)
    @url  = "http://www.MSFT401k.com"
    mail(:to => email, :subject => "We Are Live!")
  end

  def custom_note_email(email)
    @url  = "http://www.MSFT401k.com"
    mail(:to => email, :subject => "Frequently Asked Questions")
  end
end
