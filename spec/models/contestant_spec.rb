require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe 'relationships' do
    it { should belong_to :bachelorette }
    it { should have_many :outings }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :hometown }
  end
end
