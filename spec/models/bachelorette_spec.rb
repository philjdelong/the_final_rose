require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should have_many :contestants}
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :season_number }
    it { should validate_presence_of :season_description }
  end

  describe 'methods' do
    before :each do
      @courtney = Bachelorette.create(
        name: "Courtney",
        season_number: 6,
        season_description: "WORLD PEACE!"
      )

      @hagrid = Bachelorette.create(
        name: "Hagrid",
        season_number: 7,
        season_description: "Wingardium Leviosa"
      )

      @phil = @courtney.contestants.create(
        name: "Phil",
        age: 29,
        hometown: "Columbus, OH"
      )

      @sam = @courtney.contestants.create(
        name: "Sam",
        age: 13,
        hometown: "Hawesville, KY"
      )

      @capo = @courtney.contestants.create(
        name: "Capo",
        age: 7,
        hometown: "Hawesville, KY"
      )

      @jonathan = @hagrid.contestants.create(
        name: "Capo",
        age: 29,
        hometown: "Hawesville, KY"
      )
    end

    it "can show me average age" do
      expect(@courtney.contestant_avg_age).to eq(16.33)
    end

    it "can show me unique contestant hometowns" do
      expect(@courtney.unique_hometowns.length).to eq(2)
    end
  end
end
