require 'rails_helper'

RSpec.describe Job, type: :model do
  it "has a valid factory" do
    expect(build(:job)).to be_valid
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:project_id) }
    it { is_expected.to validate_presence_of(:resource_id) }
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:end_date) }
  end

  describe 'associations' do
    it { should belong_to(:resource) }
    it { should belong_to(:project) }
  end
end
