OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '122136647980674', 'f0b5aeb338c1068116134ac109aea2e4'
  #FACEBOOK_APP_ID, FACEBOOK_SECRET
end