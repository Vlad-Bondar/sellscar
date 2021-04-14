Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  # scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  devise_for :users, skip: :omniauth_callbacks
  # get 'posts/index'
  # get 'posts/new',         to: 'posts#new'
  # get 'posts/edit/:id',    to: 'posts#edit'
  # get 'posts/:id',         to: 'posts#show'
  # post 'posts/create',     to: 'posts#create'
  # post 'posts/update/:id', to: 'posts#update'
  
  post 'comments/create/:post_id', to: 'comments#create' , constraints: {post_id: /\d+/}
  post 'comments/create/:post_id/replise/:parent_id', to: 'comments#create' , constraints: {post_id: /\d+/}
  
  get 'posts/user_cars',   to: 'posts#user_cars'
  resources :posts do
    resources :images, only: [:create , :destroy]
  end
  root to: 'posts#index'
end
