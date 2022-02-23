Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    resources :users, only: [:create]
    resource :session, only: [:create, :destroy, :show]
    resources :restaurants, only: [:index]
    resources :restaurants, only: [:show] do
      resources :items, only: [:index, :show]
    end
    resources :locations, only: [:show, :create, :update]
    resources :saves, only: [:create, :index, :destroy]

  end
  root "static_pages#root"
end