class ProfilesController < ApplicationController
  def new
    $job = Job.find(params[:job_id])
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save!
      redirect_to new_application_path(job_id: $job.id)
    else
      render :new
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:user_id,:name,:email,:contact,:dob,:qualification,:skills,:address)
  end
end
