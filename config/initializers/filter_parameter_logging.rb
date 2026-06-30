# Be sure to restart your server when you modify this file.

# Configure sensitive parameters which will be filtered from the log file.
Rails.application.config.filter_parameters += [
  :password, :password_confirmation,
  :secret, :token, :_key, :crypt, :salt, :certificate, :otp, :ssn,
  :access_token, :refresh_token, :app_secret, :client_secret,
  :reset_password_token, :confirmation_token, :unlock_token, :authenticity_token
]
