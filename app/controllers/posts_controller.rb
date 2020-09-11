require 'sort_posts.rb'

class PostsController < ApplicationController
  
  include SortPosts

  before_action :authenticate_user!, except: [:index , :show]

  def index 
    @posts = sort_by_params(params[:sort] , Post.all)

     #byebug
  end

  def new
    @post = Post.new
    @car = Car.new

    @post.car = @car
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.comments_for_post(@post.id)
    @replies = Comment.replies_for_post(@post.id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    
    @post = Post.new(post_params)
    @car = Car.new(car_params)

    @post.car = @car
    # byebug

    @post.user_id = current_user.id

    

    if @post.save && @car.save
      redirect_to '/posts/' + @post.id.to_s
    else
      render '/posts/new'
   end
  end

  def update
    @post = Post.find(params[:id])
    @post.car = Car.find(params[:id])

    @post.update(post_params)
    @post.car.update(car_params)

    # byebug

    if @post.update(post_params) && @post.car.update(car_params)
      redirect_to '/posts/' + @post.id.to_s
    else
      render 'edit'
    end
  end

  def user_cars
    @posts = current_user.posts
  end

  private

  def post_params
    params.require(:post).permit(:small_description, :big_description, :image)
  end

  def car_params
    params.require(:car).permit(:car_name, :drivetrain, :location, :transmition, :vin, :exterior_collor, :interior_collor, :millage, :body_style, :engine, :price)
  end
end


