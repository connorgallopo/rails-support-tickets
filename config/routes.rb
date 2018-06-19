Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#home"
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  post '/assign' => 'tickets#assign'
  resources :users, only: %i[new create]
  resources :tickets do
    resources :comments
  end
  namespace :admin do
    resources :users
  end
end
