Rails.application.routes.draw do
  devise_for :users
  root            to: 'home#index'
  get '/about',   to: 'home#about'
  get '/search',  to: 'home#search'
  post '/search', to: 'home#search'
end
