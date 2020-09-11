Rails.application.routes.draw do

  resources :links, only: [:create, :index]

  get '/s/:slug', to: 'links#show', as: :short
  get '/stats', to: 'links#stats', as: :stats_path
  
  root to: 'links#index'

end
