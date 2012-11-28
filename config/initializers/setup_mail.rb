ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'gmail.com',
  :user_name            => ENV["SITE_EMAIL"],
  :password             => ENV["SITE_PASSWD"],
  :authentication       => 'plain',
  :enable_starttls_auto => true
}