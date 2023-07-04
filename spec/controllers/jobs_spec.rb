require 'rails_helper'

RSpec.describe "Jobs", type: :controller do
  describe "GET /index" do
    it "should return index" do
      get :index
      assert_equal Job.all, assigns(:jobs)
    end
  end
end
