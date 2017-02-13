class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @companies = Company.all
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      @companies = Company.all
      flash[:errors] = "Não foi possível criar a vaga"
      render :new
    end
  end

  private
  def job_params
    params.require(:job).permit(:title, :location, :company_id, :category, :description, :featured)
  end
end
