Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  # scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  devise_for :users, skip: :omniauth_callbacks
  
  post 'car/:car_id/images/create', to: 'images#create', constraints: {car_id: /\d+/}, as: :car_image_create
  delete 'car/:car_id/images/:index/destroy', to: 'images#destroy', as: :car_image_destroy
  post 'comments/create/:post_id', to: 'comments#create', constraints: {post_id: /\d+/}
  post 'comments/create/:post_id/replise/:parent_id', to: 'comments#create' , constraints: {post_id: /\d+/}

  get 'car_models/get_car_models_by_brand', to: 'car_models#get_car_models_by_brand'
  
  get 'posts/user_cars',   to: 'posts#user_cars'
  get 'posts/user_favorites', to: "posts#user_favorites"
  resources :posts do
    member do
      post 'toggle_favorite', to: "posts#toggle_favorite"
    end
  end

  root to: 'posts#index'
end
