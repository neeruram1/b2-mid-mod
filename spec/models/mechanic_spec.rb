require 'rails_helper'
RSpec.describe Mechanic, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :years_of_exp }
  end

  describe "relationships" do
    it { should have_many :mechanic_rides}
  end
end
