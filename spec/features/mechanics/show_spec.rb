require 'rails_helper'

RSpec.describe "Mechanic's show page" do
  before(:each) do
    @disney = AmusementPark.create(name: "Disney World", admission_price: 100)

    @space_mountain = Ride.create(name: "Space Mountain", thrill_rating: 6, amusement_park: @disney)
    @splash_mountain = Ride.create(name: "Splash Mountain", thrill_rating: 8, amusement_park: @disney)
    @its_a_small_world = Ride.create(name: "It's A Small World", thrill_rating: 2, amusement_park: @disney)
    @haunted_mansion = Ride.create(name: "The Haunted Mansion", thrill_rating: 7, amusement_park: @disney)

    @mechanic1 = Mechanic.create(name: "Michael Bluth", years_of_exp: 10)

    MechanicRide.create(mechanic: @mechanic1, ride: @space_mountain)
    MechanicRide.create(mechanic: @mechanic1, ride: @its_a_small_world)
    MechanicRide.create(mechanic: @mechanic1, ride: @splash_mountain)
  end

  it "I see their name, years of experience, and names of all rides they’re working on" do
    visit "/mechanics/#{@mechanic1.id}"
    expect(page).to have_content("Mechanic: #{@mechanic1.name}")
    expect(page).to have_content("Years of Experience: #{@mechanic1.years_of_exp}")
    expect(page).to have_content("Current Rides They're Working On:")

    within (".mechanic-ride-list") do
      expect(page).to have_content(@space_mountain.name)
      expect(page).to have_content(@its_a_small_world.name)
      expect(page).to have_content(@splash_mountain.name)
    end
  end

  # it "I also see a form to add a ride to their workload" do
  #   # When I fill in that field with an id of an existing ride and hit submit
  #   # I’m taken back to that mechanics show page
  #   # And I see the name of that newly added ride on this mechanics show page
  #
  # end
end





# Add a ride to workload:
# _pretent_this_is_a_textfield_
#                       Submit
