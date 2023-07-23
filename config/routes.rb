Rails.application.routes.draw do
  
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy' 
  resources :jogging_times, except: [:new, :edit]

  resources :users, except: [:new, :edit]
end
