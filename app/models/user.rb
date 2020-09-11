class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable, :trackable 
  has_many :posts

  devise :database_authenticatable, :registerable, :lockable, :recoverable, 
         :rememberable, :validatable, :confirmable, :omniauthable
         
end
