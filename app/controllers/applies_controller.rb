class AppliesController < ApplicationController
  def new
    @job = Job.find(params[:id])
    @applies = @job.current_user.applies.new
  end
end
