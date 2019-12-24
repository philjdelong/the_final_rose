require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when i visit a contestants show page" do
    before :each do

      @courtney = Bachelorette.create(
        name: "Courtney",
        season_number: 6,
        season_description: "WORLD PEACE!"
      )

      @phil = @courtney.contestants.create(
        name: "Phil",
        age: 29,
        hometown: "Columbus, OH"
      )

      @fooseball = @phil.outings.create(
        name: "Fooseball"
      )

      @hopscotch = @phil.outings.create(
        name: "Hopscotch"
      )

      visit "/contestants/#{@phil.id}"
    end

    it "i can see the contestants name" do
      expect(page).to have_content("#{@phil.name}")
    end

    it "i can see the season number and description" do
      expect(page).to have_content("#{@phil.bachelorette.season_number}")
      expect(page).to have_content("#{@phil.bachelorette.season_description}")
    end

    it "i can see all outings and click each outing to visit show page" do
      click_on "#{@fooseball.name}"
      expect(current_path).to eq("/outings/#{@fooseball.id}")

      visit "/contestants/#{@phil.id}"
      click_on "#{@hopscotch.name}"
      expect(current_path).to eq("/outings/#{@hopscotch.id}")
    end
  end
end
