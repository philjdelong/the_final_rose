require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when i visit the contestants index page" do
    before :each do

      @courtney = Bachelorette.create(
        name: "Courtney",
        season_number: 6,
        description: "WORLD PEACE!"
      )

      @hagrid = Bachelorette.create(
        name: "Hagrid",
        season_number: 7,
        description: "Wingardium Leviosa"
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

      @capo = @hagrid.contestants.create(
        name: "Capo",
        age: 7,
        hometown: "Hodgenville, KY"
      )

    end

    it "i can click each contestant name and view their show page" do
      visit "/bachelorettes/#{@courtney.id}/contestants"

      click_link "#{@phil.name}"
      expect(current_path).to eq("/contestants/#{@phil.id}")

      visit "/bachelorettes/#{@courtney.id}/contestants"

      click_link "#{@sam.name}"
      expect(current_path).to eq("/contestants/#{@sam.id}")

      # move to next story
      # expect(page).to have_content(@phil.name)
      # expect(page).to have_content(@phil.age)
      # expect(page).to have_content(@phil.hometown)
    end
  end
end
