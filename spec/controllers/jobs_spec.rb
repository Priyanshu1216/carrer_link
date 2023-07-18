require 'rails_helper'

RSpec.describe JobsController, type: :controller do
  include Devise::Test::ControllerHelpers

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    user = FactoryBot.create(:user)
    sign_in user
  end

  describe 'GET index' do
    it 'returns index' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET show' do
    it 'returns show' do
      job = FactoryBot.create(:job)
      get :show, params: { id: job.id }
      expect(response).to be_successful
    end
  end

  describe 'GET new' do
    it 'returns new' do
      get :new
      expect(response).to be_successful
    end

    it 'assigns a new job to @job' do
      get :new
      expect(assigns(:job)).to be_a_new(Job)
    end
  end

  describe 'POST create' do
    context 'with valid attributes' do
      it 'creates a new job' do
        expect {
          post :create, params: { job: (let(:job) {build(:job)}) }
        }.to change(Job, :count).by(1)
      end

      it 'redirects to the created job' do
        post :create, params: { job: (let(:job) {build(:job)}) }
        expect(response).to redirect_to(Job.last)
      end
    end
  end
end
