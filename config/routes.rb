Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  namespace :admin do
    resources :users
  end
  root to: "tasks#index"
  resources :tasks do
    post :confirm, action: :new_confirm, on: :new
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
