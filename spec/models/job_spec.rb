require 'rails_helper'

RSpec.describe Job, type: :model do

  let(:job) {build(:job)}

  describe 'associations' do
    it { should belong_to(:category) }
    it { should belong_to(:user) }
    it { should have_many(:applies) }
    it { should have_many(:applicants) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:salary) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:skillset) }
    it { should validate_presence_of(:experience) }
  end

end
