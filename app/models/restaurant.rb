class Restaurant < ActiveRecord::Base
  has_many :users, through: :favorite_restaurants

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
end
