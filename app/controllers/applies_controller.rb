class AppliesController < ApplicationController

  def index

  end

  def show

  end

  def new_apply
    applies = Apply.new(job_id: params[:job_id], user_id: current_user.id)
    applies.save

    redirect_to root_path
  end
end
