require 'rails_helper'
RSpec.describe Ride, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :thrill_rating }
  end

  describe "relationships" do
    it { should belong_to :amusement_park }
    it { should have_many :mechanic_rides }
    it { should have_many(:mechanics).through(:mechanic_rides) }
  end

  describe "methods" do
    it ".alpha_order" do
      disney = AmusementPark.create(name: "Disney World", admission_price: 100)
      space_mountain = Ride.create(name: "Space Mountain", thrill_rating: 6, amusement_park: disney)
      splash_mountain = Ride.create(name: "Splash Mountain", thrill_rating: 8, amusement_park: disney)
      its_a_small_world = Ride.create(name: "It's A Small World", thrill_rating: 2, amusement_park: disney)

      expect(Ride.alpha_order).to eq([its_a_small_world, space_mountain, splash_mountain])
    end
  end
end
