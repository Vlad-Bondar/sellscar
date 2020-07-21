class Post < ApplicationRecord
    has_one :car
    validates :small_description, presence: :true, length: {maximum: 200}
    validates :big_description, presence: :true
    validates_associated :car
    
end
