class Contestant <ApplicationRecord
  belongs_to :bachelorette
  has_many :contestant_outings
  has_many :outings, through: :contestant_outings

  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :hometown
end
