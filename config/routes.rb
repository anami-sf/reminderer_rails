Rails.application.routes.draw do

  
  #get 'dashboard' => 'dashboard#index'
  get 'dashboard/index'
  get 'welcome/index'

  # Twilio Route
  post 'notifications/notify' => 'notifications#notify'

  # Google authentication  => /auth/google_oauth2
  mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
  post 'auth/request', to:'authorization#get_authorization'
  get 'auth/:provider/callback' => 'sessions#googleAuth'
  get 'auth/failure' => redirect('/')

  root 'welcome#index' 

end
