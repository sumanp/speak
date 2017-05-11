Rails.application.routes.draw do
  resources :scrapes, only: [:index, :create]
end
