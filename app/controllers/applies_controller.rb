class AppliesController < ApplicationController
  before_action :applicant_details ,only: :new_apply

  def index
    if current_user.applicant?
      @job_applications = current_user.applies.all
    else
      @user = User.find(params[:user_id])
      @job = @user.jobs.find(params[:job_id])
      @applies = @job.applicants.all
    end
  end

  def show
    @apply = User.find(params[:id])
  end

  def new_apply
    @applies = Apply.new(job_id: params[:job_id], user_id: current_user.id)
    @applies.save
  end

  def applicant_details
  end
end
