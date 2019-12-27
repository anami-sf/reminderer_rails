Rails.application.routes.draw do

  root 'welcome#index'      

  get 'welcome/index'
  post 'notifications/notify' => 'notifications#notify'
end
