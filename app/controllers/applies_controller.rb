class AppliesController < ApplicationController
  before_action :find_application, only: [:accept, :reject]

  def index
    if current_user.applicant?
      @job_applications = current_user.applies.all
    else
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
    @apply.accepted!
    flash[:alert] = "You just accepted a application"
    ConfirmationMailer.with(user: @applicant, job: @applied_job).accept_application.deliver_now
    redirect_to root_path
  end

  def reject
    @apply.delete
    flash[:alert] = "You just rejected a application"
    ConfirmationMailer.with(user: @applicant, job:@applied_job).reject_application.deliver_now
    redirect_to root_path
  end

  private

  def find_application
    @apply = Apply.find(params[:apply_id])
    @applicant = User.find_by(id: @apply.user_id)
    @applied_job = Job.find_by(id:@apply.job_id)
  end
end