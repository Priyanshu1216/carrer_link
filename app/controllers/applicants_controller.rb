class ApplicantsController < ApplicationController
  def new
    byebug
    @user = User.find(params[:user_id])
    @job = @user.jobs.find(params[:id])
    @applicant = @job.applicants.new
  end

  def create
    byebug
    @user = User.find(params[:user_id])
    @job = @user.jobs.find(params[:id])
    @applicant = @job.applicants.new(applicant_params)
    if @applicant.save
      byebug
      redirect_to applicant_path(id: @applicant.id,job_id: @job.id,user_id: @user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @job = @user.jobs.find(params[:job_id])
    @applicant = @job.applicants.find(params[:id])
  end

  private

  def applicant_params
    params.require(:applicant).permit(:name,:email,:contact,:skills,:job_id)
  end
end
