require 'rails_helper'

RSpec.describe Outing, type: :model do
  describe 'relationships' do
    it { should have_many :contestants }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :location }
  end

  describe 'methods' do
    it "i can count the number of contestants" do

      outing = Outing.create!(
        name: "Outing",
        location: "Location"
      )

      expect(outing.total_contestants).to eq(0)
    end
  end
end
