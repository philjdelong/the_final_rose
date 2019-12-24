require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when i visit an outing show page" do
    before :each do

      @courtney = Bachelorette.create(
        name: "Courtney",
        season_number: 6,
        season_description: "Whacky AF"
      )

      @phil = @courtney.contestants.create(
        name: "Phil",
        age: 29,
        hometown: "Columbus, OH"
      )

      @sam = @courtney.contestants.create(
        name: "Sam",
        age: 13,
        hometown: "Columbus, OH"
      )

      @capo = @courtney.contestants.create(
        name: "Capo",
        age: 7,
        hometown: "Columbus, OH"
      )

      @fooseball = Outing.create(
        name: "Fooseball",
        location: "Denver"
      )

      @hopscotch = Outing.create(
        name: "Hopscotch",
        location: "Boulder"
      )

      @phil.outings << [@fooseball, @hopscotch]
      @sam.outings << [@fooseball]
      @capo.outings << [@hopscotch, @fooseball]

      visit "/outings/#{@fooseball.id}"
    end

    it "i can see name location and date" do
      expect(page).to have_content(@fooseball.name)
      expect(page).to have_content(@fooseball.location)
      expect(page).to have_content(@fooseball.created_at)
    end

    it "i can see total number of contestants and contestant names" do
      expect(page).to have_content('Total Contestants: 3')
      expect(page).to have_content('Phil')
      expect(page).to have_content('Sam')
      expect(page).to have_content('Capo')
    end
  end
end
