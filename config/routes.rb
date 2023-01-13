Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :products, only: %i[index show new create] do
    resources :posts, only: %i[new create update]
  end
  resources :posts, only: %i[destroy]

end
