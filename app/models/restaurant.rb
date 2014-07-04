class Restaurant < ActiveRecord::Base
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
end
