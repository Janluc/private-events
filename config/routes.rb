# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[new create show]
  resources :events, only: %i[new create show index]

  root 'users#new'

  get '/sign-in', to: 'users#new_sign_in'
  post '/sign-in', to: 'users#sign_in'
  post '/events/:id', to: 'events#join'
  post '/sign_out', to: 'users#destroy'
end
