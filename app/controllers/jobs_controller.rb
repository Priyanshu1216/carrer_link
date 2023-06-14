class JobsController < ApplicationController
  before_action :setup_client, only: %i[show new create edit destroy update index]
  def index
    @jobss = @client.jobs.all
  end

  def show
    @job = @client.jobs.find(params[:id])
  end

  def new
    @job = @client.jobs.new
  end

  def create
    @job = @client.jobs.new(job_params)
    if @job.save
      redirect_to client_job_path(id:@job)
    else
      render :new
    end
  end

  def edit
    @job = @client.jobs.find(params[:id])
  end

  def update
    @job = @client.jobs.find(params[:id])
    if @job.update(job_params)
      redirect_to client_job_path(id:@job,client_id:@client.id)
    else
      render :edit 
    end
  end

  def destroy
    @job = @client.jobs.find(params[:id])
    @job.destroy
    redirect_to root_path(client_id: @client.id)
  end

  private

  def job_params
    params.require(:job).permit(:title,:description,:salary,:experience,:location,:client_id)
  end

  def setup_client
    @client = Client.find(params[:client_id])
  end

end
