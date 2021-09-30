Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :reservations, only: [:create]
      resources :so_reservations, only: [:create]
      resources :monads_reservations, only: [:create]
    end
  end
end
