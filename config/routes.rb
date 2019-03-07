Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/search', to: 'search#index'

  
  get '/register', to: 'registration#new', as: 'register'
  post '/register', to: 'registration#create', as: 'new_registration'
  
  get '/login',     to: 'sessions#new',     as: 'login'
  post '/login',    to: 'sessions#create',  as: 'new_login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  
  resources :widgets, only: %i[index show]
  
  resources :user_search, only: %i[index]

  get '/dashboard', to: 'user_widgets#index'

  get '/user_widgets', to: 'user_widgets#new', as: 'new_widget'
  post '/user_widgets', to: 'user_widgets#create', as: 'create_widget'

  get 'user_widgets/:id/edit', to: 'user_widgets#edit', as: 'edit_widget'
  put 'user_widgets/:id', to: 'user_widgets#update', as: 'update_widget'

  delete 'user_widgets/:id', to: 'user_widgets#destroy', as: 'delete_widget'
end
