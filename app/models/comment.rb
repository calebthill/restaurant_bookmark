class Comment < ActiveRecord::Base
  belongs_to :restaurant, dependent: :destroy
  belongs_to :user, dependent: :nullify

  validates :body, presence: true
  validates :restaurant, presence: true
  validates :user, presence: true
end
