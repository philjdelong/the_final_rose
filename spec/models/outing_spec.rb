require 'rails_helper'

RSpec.describe Outing, type: :model do
  describe 'relationships' do
    it { should have_many :contestants }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :location }
  end
end
