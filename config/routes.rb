Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :loans, only: [:index, :show] do
    resources :payments, only: [:index, :create]
  end
  resources :payments, only: [:show]
  
end
