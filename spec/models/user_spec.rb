require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {build(:user)}

  describe 'associations' do
    it {should have_many(:jobs)}
    it {should have_many(:applies)}
    it {should have_many(:applicants)}
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
