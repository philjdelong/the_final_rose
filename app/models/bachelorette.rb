class Bachelorette <ApplicationRecord
  has_many :contestants

  validates_presence_of :name
  validates_presence_of :season_number
  validates_presence_of :season_description

  def contestant_avg_age
    contestants.average(:age).to_f.round(2)
  end

  def unique_hometowns
    hometowns = contestants.map do |contestant|
      contestant.hometown
    end
    hometowns.uniq
  end
end
