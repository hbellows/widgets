Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/search', to: 'search#index'

  get '/dashboard', to: 'users#show'

  get '/login',     to: 'sessions#new',     as: 'login'
  post '/login',    to: 'sessions#create',  as: 'new_login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  
  resources :widgets, only: %i[index show]
  resources :users, only: %i[new create show]
end
