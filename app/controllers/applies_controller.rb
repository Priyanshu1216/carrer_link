class AppliesController < ApplicationController
  load_and_authorize_resource
  before_action :find_application, only: [:accept, :reject]

  def index
    if current_user.applicant?
      @job_applications = current_user.applies.all.page(params[:page])
    else
      @applies = Apply.where(job_id: params[:job_id]).page(params[:page])
    end
  end

  def show
    @applies = Apply.find(params[:apply_id])
    @apply = User.find(params[:id])
  end

  def new_apply
    # @applies = Apply.new(job_id: params[:job_id], user_id: current_user.id)
    # @applies.save
    existing_apply = Apply.find_by(job_id: params[:job_id], user_id: current_user.id)
    if existing_apply
      redirect_to root_path, alert: "You have already applied for this job."
    else
      @applies = Apply.new(job_id: params[:job_id], user_id: current_user.id)
      @applies.save
    end

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
    @apply.rejected!
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