Rails.application.routes.draw do

  root 'welcome#index' 
  
  # Routes for Google authentication
  get 'auth/:provider/callback' => 'sessions#googleAuth'
  get 'auth/failure' => redirect('/')

  get 'welcome/index'
  post 'notifications/notify' => 'notifications#notify'
  
end
