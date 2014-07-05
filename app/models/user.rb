class User < ActiveRecord::Base
  has_many :favorite_restaurants
  has_many :restaurants, through: :favorite_restaurants
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
