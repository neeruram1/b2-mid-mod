require 'rails_helper'
RSpec.describe "Amusement Park show page" do
  before(:each) do
    @disney = AmusementPark.create(name: "Disney World", admission_price: 100)
    @universal = AmusementPark.create(name: "Universal Studios", admission_price: 75)

    @space_mountain = Ride.create(name: "Space Mountain", thrill_rating: 6, amusement_park: @disney)
    @splash_mountain = Ride.create(name: "Splash Mountain", thrill_rating: 8, amusement_park: @disney)
    @its_a_small_world = Ride.create(name: "It's A Small World", thrill_rating: 2, amusement_park: @disney)
  end

  it "I see the name and price of admissions for that amusement park" do
    visit "/amusement_parks/#{@disney.id}"

    expect(page).to have_content(@disney.name)
    expect(page).to have_content("Admission: $#{@disney.admission_price}")
  end

  it "I see the names of all the rides that are at that theme park listed in alphabetical order" do
    visit "/amusement_parks/#{@disney.id}"

    expect(page).to have_content(@its_a_small_world.name)
    expect(page).to have_content(@space_mountain.name)
    expect(page).to have_content(@splash_mountain.name)
  end

  it "I see the average thrill rating of this amusement park’s rides" do
    visit "/amusement_parks/#{@disney.id}"

    expect(page).to have_content("Average Thrill Rating of Rides: 5.3/10")

    visit "/amusement_parks/#{@universal.id}"
    
    expect(page).to_not have_content("Average Thrill Rating of Rides:")
  end
end
