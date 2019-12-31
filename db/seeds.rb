# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

courtney = Bachelorette.create(
  name: "Courtney",
  season_number: 6,
  season_description: "WORLD PEACE!"
)

hagrid = Bachelorette.create(
  name: "Hagrid",
  season_number: 7,
  season_description: "Wingardium Leviosa"
)

phil = courtney.contestants.create(
  name: "Phil",
  age: 29,
  hometown: "Columbus, OH"
)

sam = courtney.contestants.create(
  name: "Sam",
  age: 13,
  hometown: "Hawesville, KY"
)

capo = hagrid.contestants.create(
  name: "Capo",
  age: 7,
  hometown: "Hawesville, KY"
)
