class AppliesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @job = @user.jobs.find(params[:job_id])
    @applies = @job.applicants.all
  end

  def show
    @apply = Apply.find(params[:apply_id])
  end

  def new_apply
    @applies = Apply.new(job_id: params[:job_id], user_id: current_user.id)
    @applies.save

    redirect_to root_path
  end
end
