Rails.application.routes.draw do
  root 'static_pages#index'
  get '/trails/:id', to: 'trails#show'
  get '/trails', to: 'trails#index'
  get '/search', to: 'trails#search'
  get '/searchid', to: 'trails#searchid'
  # get '/trails/:id/flora', to: 'plants#show'
  # get '/flora', to: 'plants#index'
  # get '/trails/:id/fauna', to: 'birds#show'
  # get '/fauna', to: 'birds#index'
end
