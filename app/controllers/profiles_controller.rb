class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_profile, only: :edit
  load_and_authorize_resource

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

  def edit
    @job = Job.find(params[:job_id])
  end

  def update
    @profile = Profile.find(params["id"])
    @job = Job.find(params[:profile][:job_id])
    if @profile.update!(profile_params)
      redirect_to new_application_path(job_id: @job.id)
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:user_id,:name,:email,:contact,:dob,:qualification,:skills,:address)
  end

  def find_profile
    @profile = Profile.find(params[:profile_id])
  end
end
