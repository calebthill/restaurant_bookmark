class FavoriteRestaurant < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :user_id, presence: true
  validates :user_id, numericality: true

  validates :restaurant_id, presence: true
  validates :restaurant_id, numericality: true
end
