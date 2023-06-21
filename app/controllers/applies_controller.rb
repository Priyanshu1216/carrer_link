class AppliesController < ApplicationController
  before_action :applicant_details ,only: :new_apply

  def index
    @user = User.find(params[:user_id])
    @job = @user.jobs.find(params[:job_id])
    @applies = @job.applicants.all
  end

  def show
    @apply = User.find(params[:id])
  end

  def new_apply
    @applies = Apply.new(job_id: params[:job_id], user_id: current_user.id)
    @applies.save
    redirect_to root_path
  end

  def applicant_details
  end
end
