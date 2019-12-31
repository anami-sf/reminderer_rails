#Rails.application.config.session_store :cookie_store, SameSite: 'None'
# Rails.application.config.session_store :cookie_store, same_site: :lax
#:secure

if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_remindererapi', domain: 'your-frontend-domain'
else
    Rails.application.config.session_store :cookie_store, key: '_remindererapi' 
end


# Rails.application.config.action_dispatch.default_headers = {
#     'X-Frame-Options' => 'SAMEORIGIN',
#     'X-XSS-Protection' => '1; mode=block',
#     'X-Content-Type-Options' => 'nosniff',
#     'X-Download-Options' => 'noopen',
#     'X-Permitted-Cross-Domain-Policies' => 'none',
#     'Referrer-Policy' => 'strict-origin-when-cross-origin',
#     'Access-Control-Allow-Origin' => 'https://localhost:3001'
#   }