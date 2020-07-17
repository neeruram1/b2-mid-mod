class Ride < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :thrill_rating, numericality: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10
  belongs_to :amusement_park
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  def self.alpha_order
    Ride.order(:name)
  end

  def self.avg_thrill_rating
    Ride.average(:thrill_rating).to_f.round(1)
  end
end
