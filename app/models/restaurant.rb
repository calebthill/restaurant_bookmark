class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :favorite_restaurants
  has_many :users, through: :favorite_restaurants
  has_many :comments

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true

  after_create :add_favorite

  def is_favorite?(user)
    user.restaurants.include?(self)
  end

  private
    def add_favorite
      user.restaurants << self
    end
end
