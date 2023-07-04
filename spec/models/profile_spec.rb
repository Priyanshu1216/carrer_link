require 'rails_helper'

RSpec.describe Profile, type: :model do
  # profile = FactoryBot.create(:profile)
  let(:profile) {build(:profile)}

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
