class UserMailer < ActionMailer::Base
  default from: "The MSFT401k Team <team@MSFT401k.com>"

  def welcome_email(email)
    @url  = "http://www.MSFT401k.com"
    @user = User.find_by_email(email)
    current_time_utc = Time.now.change(usec: 0)
    current_time = current_time_utc.in_time_zone('America/Los_Angeles')
    @user.welcomed_at = current_time
    @user.welcomed_count = @user.welcomed_count + 1
    @user.wmpt = (current_time.year * 100 + current_time.month)
    @user.save
    mail(:to => email, :subject => "Welcome to MSFT401k!")
  end

  def first_monthly_email(email)
    puts "\n\n\nStarting sending first monthly mail to " + email + " ..."
    @url  = "http://www.MSFT401k.com"
    @email = email
    current_time = Time.now.in_time_zone('America/Los_Angeles')
    month_year = Date::MONTHNAMES[current_time.month] + " " + current_time.year.to_s
    mail(:to => email, :subject => "MSFT401k - " + month_year + " Rebalance")
    puts "Finished sending first monthly mail to " + email
  end

  def regular_monthly_email(email)
    puts "\n\n\nStarting sending regular monthly mail to " + email + " ..."
    @url  = "http://www.MSFT401k.com"
    @email = email
    current_time = Time.now.in_time_zone('America/Los_Angeles')
    month_year = Date::MONTHNAMES[current_time.month] + " " + current_time.year.to_s
    mail(:to => email, :subject => "MSFT401k - " + month_year + " Rebalance")
    puts "Finished sending regular monthly mail to " + email
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

  def variable_email(email, subject, content)
    @url  = "http://www.MSFT401k.com"
    @content = content
    mail(:to => email, :subject => subject)
  end
end
