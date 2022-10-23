Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :shops, only: [:index, :show]
      resources :favorites, only: [:create, :destroy]
      resources :users
      resources :favorites
      resources :sessions
    end
  end
end
