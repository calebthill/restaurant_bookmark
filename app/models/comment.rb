class Comment < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user

  validates :body, presence: true
end
