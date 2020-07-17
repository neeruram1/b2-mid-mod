require 'rails_helper'
RSpec.describe "Amusement Park show page" do
  before(:each) do
    @disney = AmusementPark.create(name: "Disney World", admission_price: 100)
    @space_mountain = Ride.create(name: "Space Mountain", thrill_rating: 6, amusement_park: @disney)
    @splash_mountain = Ride.create(name: "Splash Mountain", thrill_rating: 8, amusement_park: @disney)
    @small_world = Ride.create(name: "It's A Small World", thrill_rating: 2, amusement_park: @disney)
  end

  it "I see the name and price of admissions for that amusement park" do
    visit "/amusement_parks/#{@disney.id}"

    expect(page).to have_content(@disney.name)
    expect(page).to have_content("Admission: $#{@disney.admission_price}")
  end

  # it "I see the names of all the rides that are at that theme park listed in alphabetical order" do
  #   visit "/amusement_parks/#{@disney.id}"
  #
  # end
  #
  # it "I see the average thrill rating of this amusement park’s rides" do
  #   visit "/amusement_parks/#{@disney.id}"
  #
  # end
end















# Ex: Hershey Park
#    Admissions: $50.00
#
#    Rides:
#           1. Lightning Racer
#           2. Storm Runner
#           3. The Great Bear
#    Average Thrill Rating of Rides: 7.8/10
