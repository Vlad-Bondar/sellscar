require 'sort_posts.rb'

# Доделать: комментарии скролбар для картинок
# Добавить: мини чат и систему рейтинга объявлений поддержку двух языков(по возможности)

class PostsController < ApplicationController
  include SortPosts

  before_action :authenticate_user!, except: [:index , :show]
  before_action :set_post , only: [:edit, :update, :show, :destroy]
  
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def new
    @post = Post.new
    @car = Car.new
    @car.build_brand
    @car.build_car_model
  end

  def show
    @car = @post.car
    @comments = Comment.comments_for_post(@post.id)
    @replies = Comment.replies_for_post(@post.id)
  end

  def edit
    @car = @post.car
    authorize! :edit, @post && authorize! :edit, @car
  end

  def create
    @post = Post.new(post_params)
    @car = Car.new(car_params)
    
    @post.user_id = current_user.id
    @post.car = @car
        
    if @post.save && @car.save
      connect_brand_and_model(@car.brand, @car.car_model)
      redirect_to '/posts/' + @post.id.to_s
    else
      render '/posts/new'
   end
  end

  def update
    @car = @post.car
    if @car.update(car_params) &&  @post.update(post_params) 
      connect_brand_and_model(@car.brand, @car.car_model)
      redirect_to '/posts/' + @post.id.to_s
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_user_cars_path
  end

  def user_cars
    @posts = sort_by_params(params[:sort], current_user.posts)
  end

  def user_favorites
    @posts = current_user.favorite_posts
  end

  def toggle_favorite
    @post = Post.find(params[:id])
    current_user.favorited?(@post) ? current_user.unfavorite(@post) : current_user.favorite(@post)
    
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:small_description, :big_description, :status)
  end

  def car_params
    params.require(:car).permit(:drivetrain, :location, :year_of_production, :engine_volume, :transmition, :type_of_fuel, :vin, :exterior_collor, :interior_collor, { images: [] }, :millage, :body_style, :engine, :price, :brand_id, :car_model_id, :post_id, brand_attributes: [:title], car_model_attributes: [:title]) 
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def connect_brand_and_model(brand,model)
    model.update(brand_id: brand.id)
  end
end


