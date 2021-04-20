class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable, :trackable 
  has_many :posts , dependent: :destroy

  devise :database_authenticatable, :registerable, :lockable, :recoverable, 
         :rememberable, :validatable, :confirmable, :omniauthable
  
  acts_as_favoritor
end
