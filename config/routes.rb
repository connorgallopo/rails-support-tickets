Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#home"
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/assign' => 'tickets#assign'
  get '/forbidden' => 'static_pages#forbidden'
  get '/adminonly' => 'static_pages#admin'
  resources :users, only: %i[new create]
  resources :tickets do
    resources :comments
  end
  namespace :admin do
    resources :users
    post '/admin/promote' => 'users#promote'
    post '/admin/demote' => 'users#demote'
  end
end
