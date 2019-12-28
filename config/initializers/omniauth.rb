Rails.application.config.middleware.use OmniAuth::Builder do
    id = Rails.application.credentials.google_client_id
    secret = Rails.application.credentials.google_secret
    provider :google_oauth2, id, secret
end