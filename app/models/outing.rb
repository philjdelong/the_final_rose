class Outing < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :location

  has_many :contestant_outings
  has_many :contestants, through: :contestant_outings

  def total_contestants
    contestants.length
  end
end
