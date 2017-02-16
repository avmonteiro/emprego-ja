class JobsController < ApplicationController
  before_action :find, only: [:show, :update]

  def index
    @jobs = Job.all
    @companies = Company.all
  end

  def show
  end

  def new
    @job = Job.new
    @companies = Company.all
    @categories = Category.all
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      @companies = Company.all
      @categories = Category.all
      flash[:errors] = "Não foi possível criar a vaga"
      render :new
    end

  end

  def edit
    @job = Job.find(params[:id])
    @companies = Company.all
    @categories = Category.all
  end

  def update
    if @job.update(job_params)
      redirect_to @job
    else
      @companies = Company.all
      @categories = Category.all
      flash[:errors] = "Não foi possível atualizar a vaga"
      render :edit
    end
  end

  private
  def job_params
    params.require(:job).permit(:title, :location, :company_id, :category_id, :description, :featured)
  end

  def find
    @job = Job.find(params[:id])
  end

end
