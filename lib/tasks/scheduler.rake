desc "This task is called by the Heroku scheduler add-on"

task :daily_report => :environment do
	UserMailer.daily_report_email("gary@voronel.com, joeollis@gmail.com, thebasque@gmail.com").deliver
end

task :frequent_report => :environment do
	UserMailer.daily_report_email("gary@voronel.com").deliver
end