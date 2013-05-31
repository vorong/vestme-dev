desc "This task is called by the Heroku scheduler add-on"

task :daily_report => :environment do
	UserMailer.daily_report_email("gary@voronel.com, joeollis@gmail.com, thebasque@gmail.com").deliver
end

task :frequent_report => :environment do
	UserMailer.daily_report_email("gary@voronel.com").deliver
end

task :user_report => :environment do
	UserMailer.user_report_email("gary@voronel.com").deliver
end

task :send_monthly_mails => :environment do
	current_time = Time.parse('2013-06-01 08:30:00') # Time.now

	if current_time.day == 1
		UserMailer.variable_email("gary@voronel.com","Monthly Email Script Started","").deliver
		User.where("status = 4").each do |user| 
			welcomed_month = user.welcomed_at.in_time_zone('America/Los_Angeles').month
			if welcomed_month == current_time.month
				UserMailer.variable_email("gary@voronel.com","Monthly Email Script Super New User","This user is super new: " + user.email).deliver
			elsif welcomed_month == current_time.month - 1
				UserMailer.first_monthly_email(user.email).deliver
			elsif welcomed_month < current_time.month - 1 
				UserMailer.regular_monthly_email(user.email).deliver
			else 
				UserMailer.variable_email("gary@voronel.com","Monthly Email Script Error","Something weird happened with user " + user.email).deliver
			end
		end
		UserMailer.variable_email("gary@voronel.com","Monthly Email Script Complete","").deliver
	else
		UserMailer.variable_email("gary@voronel.com","Check Failed: Monthly Email Script Not Run","").deliver
	end
end