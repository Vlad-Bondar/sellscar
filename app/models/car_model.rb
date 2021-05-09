class CarModel < ApplicationRecord
  validates :title, presence: :true

  belongs_to :brand , dependent: :destroy

end
