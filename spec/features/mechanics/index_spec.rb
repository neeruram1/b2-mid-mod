require 'rails_helper'
RSpec.describe "Mechanics index page" do
  before(:each) do
    @mechanic1 = Mechanic.create(name: "Michael Bluth", years_of_exp: 10)
    @mechanic2 = Mechanic.create(name: "Tobias Funke", years_of_exp: 8)
  end
  it "I see a header saying All Mechanics and I see a list of their names and years of experience" do

    visit '/mechanics'

    within(".mechanics-header") do
      expect(page).to have_content("All Mechanics")
    end

    within(".mechanics-#{@mechanic1.id}") do
      expect(page).to have_content("Name: #{@mechanic1.name}")
      expect(page).to have_content("Years of Experience: #{@mechanic1.years_of_exp}")
    end

    within(".mechanics-#{@mechanic2.id}") do
      expect(page).to have_content("Name: #{@mechanic2.name}")
      expect(page).to have_content("Years of Experience: #{@mechanic2.years_of_exp}")
    end
  end
end














And I see a list of all mechanic’s names and their years of experience
Ex:
             All Mechanics
   Sam Mills - 10 years of experience
   Kara Smith - 11 years of experience
