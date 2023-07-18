require 'rails_helper'

RSpec.describe Profile, type: :model do
  let(:profile) {build(:profile)}

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
