class Ride < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :thrill_rating
end
