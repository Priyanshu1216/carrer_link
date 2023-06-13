class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    # @client = Client.find(params[:client_id])
    @job = Job.find(params[:id])
  end

  def new
    # @client = Client.find(params[:client_id])
    @job = Job.new
  end

  def create
    # @client = Client.find(params[:client_id])
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to @job
    else
      render :edit 
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to root_path
  end

  private

  def job_params
    params.require(:job).permit(:title,:description,:salary,:experience,:location)
  end

end
