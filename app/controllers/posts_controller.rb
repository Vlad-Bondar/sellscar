require 'sort_posts.rb'

# Доделать: комментарии скролбар для картинок
# Добавить: мини чат и систему рейтинга объявлений поддержку двух языков(по возможности)

class PostsController < ApplicationController
  include SortPosts

  before_action :authenticate_user!, except: [:index , :show]

  def index 
    @posts = Post.where(status: 1).all.includes(:car)
    @posts = sort_by_params(params[:sort] , @posts)
  end

  def new
    @post = Post.new
    @car = Car.new
    @car.build_brand
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.comments_for_post(@post.id)
    @replies = Comment.replies_for_post(@post.id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @car = Car.new(car_params)

    @post.user_id = current_user.id

    if @post.save && @car.save
      redirect_to '/posts/' + @post.id.to_s
    else
      render '/posts/new'
   end
  end

  def update
    @post = Post.find(params[:id])
    @car = Car.find(params[:id])
    
    binding.pry
    
    if @car.update(car_params) &&  @post.update(post_params) 
      redirect_to '/posts/' + @post.id.to_s
    else
      render 'edit'
    end
  end

  def user_cars
    @posts = sort_by_params(params[:sort], current_user.posts)
  end

  private

  def post_params
    params.require(:post).permit(:small_description, :big_description, :status)
  end

  def car_params
    params.require(:car).permit(:drivetrain, :location, :transmition, :vin, :exterior_collor, :interior_collor, { images: [] }, :millage, :body_style, :engine, :price, :brand_id, brand_attributes: [:title])
  end
end


