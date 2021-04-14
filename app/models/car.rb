class Car < ApplicationRecord
  belongs_to :post
  belongs_to :brand
  validates :price, :millage, numericality: { greater_than: 0 }, presence: :true
  validates :drivetrain, :location, :transmition, :vin, :exterior_collor, :interior_collor, :body_style, presence: :true
  accepts_nested_attributes_for :brand, :reject_if => :all_blank

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
end
