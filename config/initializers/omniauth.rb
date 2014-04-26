Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  provider :odnoklassniki, ENV['OK_ID'], ENV['OK_SECRET_KEY'], :public_key => ENV['OK_PUBLIC_KEY']
end