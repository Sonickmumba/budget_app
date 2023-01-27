Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "splash_screens#index"

  resources :groups, only: [:index, :show, :create, :destroy, :new] do
    resources :entities, only: [:index, :create, :new, :destroy] do
      resource :group_entities, only: [:create]
    end
  end
end
