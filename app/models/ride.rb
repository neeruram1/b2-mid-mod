class Ride < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :thrill_rating
  belongs_to :amusement_park
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides
end
