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
      expect(page).to have_content("#{@mechanic1.name} - #{@mechanic1.years_of_exp} years of experience")
    end

    within(".mechanics-#{@mechanic2.id}") do
      expect(page).to have_content("#{@mechanic2.name} - #{@mechanic2.years_of_exp} years of experience")
    end
  end
end
