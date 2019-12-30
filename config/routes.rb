Rails.application.routes.draw do

  
  #get 'dashboard' => 'dashboard#index'
  get 'dashboard/index'
  get 'welcome/index'

  # Twilio Route
  post 'notifications/notify' => 'notifications#notify'

  # Google authentication  => /auth/google_oauth2
  get 'auth/:provider/callback' => 'sessions#googleAuth'
  get 'auth/failure' => redirect('/')

  root 'welcome#index' 

end
