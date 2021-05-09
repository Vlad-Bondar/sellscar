class Brand < ApplicationRecord
  validates :title, presence: :true
  has_many :cars
  has_many :car_models
end
