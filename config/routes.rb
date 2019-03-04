Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/search', to: 'search#index'
  resources :widgets, only: %i[index show]
  resources :users, only: %i[new create]
end
