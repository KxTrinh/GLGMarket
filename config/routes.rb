Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :posts

  get 'myposts', to: 'posts#my_posts'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts, only: [ :index, :my_posts]
    end
  end
end
