require 'rails_helper'

RSpec.describe Project, type: :model do
  it "has a valid factory" do
    expect(build(:project)).to be_valid
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:department) }
    it { is_expected.to validate_presence_of(:color) }
  end

  describe 'associations' do
    it { should have_many(:jobs) }
  end
end
