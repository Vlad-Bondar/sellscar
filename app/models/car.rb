class Car < ApplicationRecord
    belongs_to :post
    validates :price, numericality: {greater_than: 0 } presence: :true
    validates :car_name , presence: :true
    validates :drivetrain , presence: :true
    validates :location , presence: :true
    validates :transmition , presence: :true
    validates :vin , presence: :true
    validates :exterior_collor , presence: :true
    validates :interior_collor , presence: :true
    validates :body_style , presence: :true
    validates :engine , presence: :true
    validates::millage , numericality: {greater_than: 0 } presence: :true

end

