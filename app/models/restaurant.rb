class Restaurant < ActiveRecord::Base
  has_many :users, through: :favorite_restaurants
  has_many :comments

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true

  def is_favorite?(user)
    user.restaurants.include?(self)
  end
end
