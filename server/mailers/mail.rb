ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}
ActionMailer::Base.view_paths = File.expand_path('../../views', __FILE__)

case ENV["RACK_ENV"]
when "production"
  ActionMailer::Base.delivery_method = :smtp
when "test"
  ActionMailer::Base.delivery_method = :test
else
  logdir = File.expand_path('../../../logs', __FILE__)
  Dir.mkdir logdir unless File.exists?(logdir)
  ActionMailer::Base.delivery_method = :file
  ActionMailer::Base.file_settings = { :location => logdir }
end
