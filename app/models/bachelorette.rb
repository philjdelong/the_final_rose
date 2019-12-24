class Bachelorette <ApplicationRecord
  has_many :contestants

  validates_presence_of :name
  validates_presence_of :season_number
  validates_presence_of :season_description

  def contestant_avg_age
    (contestant_total_age/contestant_total_count.to_f).round(2)
  end

  def contestant_total_age
    x = 0
    contestants.each do |contestant|
      x += contestant.age
    end
    return x
  end

  def contestant_total_count
    contestants.length
  end
end
