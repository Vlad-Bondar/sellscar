Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
  get 'posts/user_cars',   to: 'posts#user_cars'
  get 'posts/new',         to: 'posts#new'
  get 'posts/edit/:id',    to: 'posts#edit'
  get 'posts/:id',         to: 'posts#show'
  post 'posts/create',     to: 'posts#create'
  post 'posts/update/:id', to: 'posts#update'
  # resources :posts
  root to: 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
