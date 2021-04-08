ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  domain: 'gmail.com',
  port: 587,
  user_name: 'basell.4rm.0823@gmail.com',
  password: 'hlhmymubxhsgibfs',
  authentication: 'plain',
  enable_starttls_auto: true
}