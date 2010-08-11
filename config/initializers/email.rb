require 'tls_smtp'
ActionMailer::Base.smtp_settings = {
  :address => "smtp.sendgrid.net",
  :port => '587',
  :enable_starttls_auto => true,
  :authentication => :login,
  :domain => CMS_CONFIG['website']['domain'],
  :user_name => CMS_CONFIG['site_settings']['sendgrid_username'],
  :password => CMS_CONFIG['site_settings']['sendgrid_password'],
}