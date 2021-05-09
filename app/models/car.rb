class Car < ApplicationRecord
  belongs_to :post
  belongs_to :brand
  belongs_to :car_model
  validates :price, :engine_volume, :year_of_production, :millage, numericality: { greater_than: 0 }, presence: :true
  validates :drivetrain, :type_of_fuel, :location, :transmition, :vin, :exterior_collor, :interior_collor, :body_style, presence: :true
  
  accepts_nested_attributes_for :brand, :reject_if => :all_blank
  accepts_nested_attributes_for :car_model, :reject_if => :all_blank

  mount_uploaders :images, ImageUploader

  enum drivetrain: {
    AWD: "AWD", 
    FWD: "FWD", 
    RWD: "RWD"
  }

  enum body_style: {
    sedan: "sedan",
    coupe: "coupe",
    SUV: "SUV",
    wagon: "wagon",
    hatchback: "hatchback",
    cabriolet: "cabriolet",
    pickup_track: "pickup track"
  }

  enum transmition: {
    manual: "manual",
    automatic: "automatic",
  }

  enum type_of_fuel: {
    petrol: "petrol",
    disel: "disel",
    hybrid: "hybrid",
    elector: "electro"
  }
end
