Rails.application.routes.draw do

  
  root 'welcome#index' 

  #auth/google_oauth2
  
  # Routes for Google authentication  => /auth/google_oauth2
  
  get 'auth/:provider/callback' => 'sessions#googleAuth'
  get 'auth/failure' => redirect('/')

  get 'welcome/index'
  post 'notifications/notify' => 'notifications#notify'

end
