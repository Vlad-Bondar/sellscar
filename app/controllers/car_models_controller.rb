class CarModelsController < ApplicationController
  def get_car_models_by_brand
    car_models = CarModel.where(brand_id: params[:brand_id])

    render json: CarModelSerializer.new(car_models).serialized_json
  end
end