Rails.application.routes.draw do
  root            to: 'home#index'
  get '/about',   to: 'home#about'
  get '/search',  to: 'home#search'
end
