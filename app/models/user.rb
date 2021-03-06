class User < ActiveRecord::Base
  paginates_per 16

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  has_many :comments
  has_many :favorite_restaurants
  has_many :restaurants, through: :favorite_restaurants
  has_many :created_restaurants, class_name: "Restaurant"

  validates :first_name, format: { with: /\A[a-zA-Z]+\z/, message: "Your first name isn't a number!" }
  validates :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "Your first name isn't a number!" }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def already_followed(other_user)
    friends_array = []
    self.friendships.each do |x|
      friends_array << x.friend
    end
    friends_array.include?(other_user)
  end

  def format_restaurants(restaurants)
    summary = {}
    restaurants.each do |r|
      summary[r.category] ||= 0
      summary[r.category] += 1
    end
    summary = summary.to_a
    summary.unshift(['Restaurants', 'Food type'])
  end

  def self.search(search)
    if search
      User.where("first_name || last_name ILIKE '%#{search}%'")
    else
      User.all
    end
  end
end
