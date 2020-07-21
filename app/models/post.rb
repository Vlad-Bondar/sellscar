class Post < ApplicationRecord
    has_one :car
    validates :small_description, presence: :true, lenght: {maximum: 200}
    validates :big_description, presence: :true
end
