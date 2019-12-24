require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when i visit a bachelorette show page" do
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

      @capo = @hagrid.contestants.create(
        name: "Capo",
        age: 7,
        hometown: "Hodgenville, KY"
      )

      visit "/bachelorettes/#{@courtney.id}"
    end

    it "i can see name season and season description" do
      expect(page).to have_content(@courtney.name)
      expect(page).to have_content(@courtney.season_number)
      expect(page).to have_content(@courtney.season_description)
    end

    it "i can click a link to see contestants" do
      click_link 'Contestants'
      expect(current_path).to eq("/bachelorettes/#{@courtney.id}/contestants")

      expect(page).to have_content(@phil.name)
      expect(page).to have_content(@phil.age)
      expect(page).to have_content(@phil.hometown)

      expect(page).to have_content(@sam.name)
      expect(page).to have_content(@sam.age)
      expect(page).to have_content(@sam.hometown)

      expect(page).to_not have_content(@capo.name)
      expect(page).to_not have_content(@capo.age)
      expect(page).to_not have_content(@capo.hometown)
    end
  end
end
