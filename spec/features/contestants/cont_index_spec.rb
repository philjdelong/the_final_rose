require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when i visit the contestants index page" do
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

      visit "/bachelorettes/#{@courtney.id}/contestants"
    end

    it "i can click each contestant name and view their show page" do

      click_link "#{@phil.name}"
      expect(current_path).to eq("/contestants/#{@phil.id}")

      visit "/bachelorettes/#{@courtney.id}/contestants"

      click_link "#{@sam.name}"
      expect(current_path).to eq("/contestants/#{@sam.id}")
    end

    it "i can see a list of unique hometowns" do
      expect(page).to have_content('Columbus, OH')
      expect(page).to have_content('Hawesville, KY')
    end
  end
end
