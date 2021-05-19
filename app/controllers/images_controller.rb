# frozen_string_literal: true

$LOAD_PATH << File.join(__dir__, "lib")
require 'image_service'

class ImagesController < ApplicationController
  include ImagesService
  before_action :set_cars_image

  def create
    if params[:car].blank?
      redirect_back(fallback_location: root_path)
    else
      add_more_images(images_params[:images])
      flash[:error] = 'Failed uploading images' unless @car.save
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    remove_image_at_index(params[:index].to_i)
    flash[:error] = 'Failed deleting image' unless @car.save
    redirect_back(fallback_location: root_path)
  end

  private

  def set_cars_image
    @car = Car.find(params[:car_id])
  end

  def images_params
    if params[:car].blank?
      redirect_back(fallback_location: root_path)
    else
      params.require(:car).permit({ images: [] })
    end
  end
end
