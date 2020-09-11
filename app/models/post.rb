class Post < ApplicationRecord
  has_one :car
  has_many :comment
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates :small_description, presence: :true, length: { maximum: 200 }
  validates :big_description, presence: :true
  validates_associated :car
  validates_associated :comment
end
