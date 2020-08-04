class PostsController < ApplicationController


    def index
        @posts = Post.all()
    end 

    def new
        @post = Post.new
        @car = Car.new

        @post.car=@car
    end

    def show 
        @post = Post.find(params[:id])
        #byebug
    end

    def edit
        @post = Post.find(params[:id])
    end

    def create 
        @post = Post.new(post_params)
        @car = Car.new(car_params)

        @post.car = @car

        #byebug

        if @post.save &&  @car.save
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
        
        
        #byebug
        
        if @post.update(post_params) &&  @post.car.update(car_params)
            redirect_to '/posts/' + @post.id.to_s
        else
            render 'edit'
        end
    end

    private 
    
    def post_params
        params.require(:post).permit(:small_description,:big_description, :image)
    end

    def car_params
        params.require(:car).permit(:car_name,:drivetrain,:location,:transmition,:vin,:exterior_collor,:interior_collor,:millage,:body_style,:engine,:price)
    end
end
