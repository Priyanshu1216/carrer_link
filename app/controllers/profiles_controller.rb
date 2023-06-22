class ProfilesController < ApplicationController
  def new
    @user = User.find(params[:id])
    @profile = @user.profiles.new
  end
end
