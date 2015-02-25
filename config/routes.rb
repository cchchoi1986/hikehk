Rails.application.routes.draw do
  root 'static_pages#index'
  get '/trails/:id', to: 'trails#show'
  get 'trails', to: 'trails#index'
end
