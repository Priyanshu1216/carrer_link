class JobsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  
  def index
    if params[:category].blank?
      @jobs = Job.all.page(params[:page])
    else
      @category_id = Category.find_by(name: params[:category]).id
      @jobs = Job.where(category_id: @category_id).page(params[:page])
    end
  end

  def show
  end

  def new
    @job = current_user.jobs.new
  end

  def create
    @job = current_user.jobs.new(job_params)
    if @job.save
      redirect_to @job
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to @job
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    flash[:danger]= "Job deleted"
    redirect_to root_path
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title,:description,:skillset,:salary,:experience,:location,:user_id,:category_id)
  end
end
