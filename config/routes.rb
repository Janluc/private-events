Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new,:create,:show]
  resources :events, only: [:new,:create,:show,:index]

  root "users#new"

  get "/sign-in", to: "users#new_sign_in"
  post "/sign_in", to: "users#sign_in"
  post '/events/:id', to: "events#join"
end
