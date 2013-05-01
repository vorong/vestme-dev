class UserMailer < ActionMailer::Base
  default from: "The MSFT401k Team <team@MSFT401k.com>"

  def welcome_email(email)
    @url  = "http://www.MSFT401k.com"
    @user = User.find_by_email(email)
    @user.welcomed_at = DateTime.current()
    @user.welcomed_count = @user.welcomed_count + 1
    @user.save
    mail(:to => email, :subject => "Welcome to MSFT401k!")
  end

  def first_monthly_email(email)
    @url  = "http://www.MSFT401k.com"
    @email = email
    mail(:to => email, :subject => "MSFT401k - May 2013")
  end

  def custom_note_email(email)
    @url  = "http://www.MSFT401k.com"
    mail(:to => email, :subject => "Frequently Asked Questions")
  end

  def daily_report_email(email)
    @url  = "http://www.MSFT401k.com"
    mail(:to => email, :subject => "Daily Report")
  end

  def user_report_email(email)
    @url  = "http://www.MSFT401k.com"
    mail(:to => email, :subject => "User Report")
  end
end
