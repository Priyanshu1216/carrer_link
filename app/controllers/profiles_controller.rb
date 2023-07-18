class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job, only: [:new, :edit]
  before_action :find_job, only: [:create, :update]
  before_action :find_profile, only: [:edit, :update]
  load_and_authorize_resource

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save!
      redirect_to new_application_path(job_id: @job.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
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
    @profile = Profile.find(params[:id])
  end

  def find_job
    @job = Job.find(params[:profile][:job_id])
  end

  def set_job
    @job = Job.find(params[:job_id])
  end
end
