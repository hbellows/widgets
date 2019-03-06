Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/search', to: 'search#index'

  get '/dashboard', to: 'user_widgets#index'

  get '/register', to: 'registration#new', as: 'register'
  post '/register', to: 'registration#create', as: 'new_registration'

  get '/login',     to: 'sessions#new',     as: 'login'
  post '/login',    to: 'sessions#create',  as: 'new_login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  
  resources :widgets, only: %i[index show]

  # resources :widgets, module: :users, only: %i[index new create]
  # resources :search, module: :users, only: %i[index]

  resources :user_search, only: %i[index]
  # resources :user_widgets, only: %i[new create]
  get '/user_widgets', to: 'user_widgets#new', as: 'my_widgets'
  post '/user_widgets', to: 'user_widgets#create', as: 'my_new_widget'




end
