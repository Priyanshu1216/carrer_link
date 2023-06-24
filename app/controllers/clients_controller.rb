class ClientsController < ApplicationController

  def index
    @users = User.where(role:'client')
  end

  def show
    @user = User.find(params[:id])
    @jobs = @user.jobs.all.page(params[:page])
  end
end