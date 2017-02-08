class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(job_params)
    # redirect_to({ action: :show, id: @job.id })
    # redirect_to job_path(@job.id)
    redirect_to @job
  end

  private
  def job_params
    params.require(:job).permit(:title, :location, :company, :category, :description)
  end
end
