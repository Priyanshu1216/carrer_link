class AppliesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_apply, only: [:accept, :reject, :show, :destroy]
  load_and_authorize_resource

  def index
    if current_user.applicant?
      @job_applications = current_user.applies.all.page(params[:page])
    else
      @applies = Apply.where(job_id: params[:job_id]).page(params[:page])
    end
  end

  def show
    @user = User.find(params[:user_id])
  end

  def new_apply
    @existing_apply = Apply.find_by(job_id: params[:job_id], user_id: current_user.id)
    if @existing_apply
      redirect_to root_path, alert: "You have already applied for this job."
    else
      @apply = Apply.new(job_id: params[:job_id], user_id: current_user.id)
      @apply.save
    end
  end

  def destroy
    @apply.destroy
    redirect_to root_path
  end

  def accept
    @apply.accepted!
    @apply.send_accept_mail
    redirect_to root_path
  end

  def reject
    @apply.rejected!
    @apply.send_reject_mail
    redirect_to root_path
  end

  private

  def find_apply
    @apply = Apply.find(params[:id])
  end
end
