class ApplicantsController < ApplicationController
  def new
    @job = Job.find(params[:id])
    @applicant = @job.applicants.new
  end

  def create
    @job = Job.find(params[:id])
    @applicant = @job.applicants.new(applicant_params)
    if @applicant.save
      redirect_to applicant_path(id: @applicant.id, job_id: @job.id)
    else
      render :new
    end
  end

  def show
    byebug
    @job = Job.find(params[:job_id])
    @applicant = @job.applicants.find(params[:id])
  end

  private

  def applicant_params
    params.require(:applicant).permit(:name,:email,:contact,:skills)
  end
end
