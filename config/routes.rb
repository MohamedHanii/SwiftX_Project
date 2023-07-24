Rails.application.routes.draw do
  
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy' 
  get '/jogging_times/weekly_report', to: 'jogging_times#weekly_report'

  resources :users, except: [:new, :edit]
  resources :jogging_times, only: [:index, :create, :show, :update, :destroy]

  resources :users, only: [] do
    resources :jogging_times, only: [:index,:create], on: :member
  end

end
