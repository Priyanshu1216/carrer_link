class AppliesController < ApplicationController

  def index
    if current_user.applicant?
      @job_applications = current_user.applies.all
    else
      # @user = User.find(params[:user_id])
      # @job = @user.jobs.find(params[:job_id])
      # @applies = @job.applicants.all
      @applies = Apply.where(job_id: params[:job_id])
    end
  end

  def show
    @applies = Apply.find(params[:apply_id])
    @apply = User.find(params[:id])
  end

  def new_apply
    @applies = Apply.new(job_id: params[:job_id], user_id: current_user.id)
    @applies.save
  end

  def destroy
    @apply = Apply.find(params[:id])
    @apply.destroy
    redirect_to root_path
  end

  def accept
    @apply = Apply.find(params[:apply_id])
    @apply.accepted!
  end

  def reject
    apply = Apply.find(params[:apply_id])
    # apply.rejected!
    apply.delete
    redirect_to root_path
  end
end