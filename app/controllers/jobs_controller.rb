class JobsController < ApplicationController

  def index
    @company             = Company.find(params[:company_id])
    @jobs                = @company.jobs
    @contact             = Contact.new
    @contact.company_id  = @company.id
  end

  def new
    @company    = Company.find(params[:company_id])
    @job        = Job.new(params[:id])
    @categories = Category.order(:title)
  end

  def create
    @categories = Category.all
    @company    = Company.find(params[:company_id])
    @job        = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @company        = Company.find(params[:company_id])
    @job            = Job.find(params[:id])
    @comment        = Comment.new
    @comment.job_id = @job.id
  end

  def edit
    @categories = Category.all
    @company    = Company.find(params[:company_id])
    @job        = Job.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @job     = Job.find(params[:id])
    @job.update(job_params)
    redirect_to company_job_path(@company, @job)
  end

  def destroy
    @company = Company.find(params[:company_id])
    @job     = Job.find(params[:id])
    @job.destroy
    redirect_to company_jobs_path(@company)
  end

  def sort
    if params[:location] != nil
      @jobs = Job.where(city: params[:location])
    elsif params[:sort] == "interest"
      @jobs = Job.order(:level_of_interest)
      render :interest
    else
      @jobs = Job.where(city: params[:sort])
    end
  end

  def dashboard
    @job_count_by_interest = Job.order(:level_of_interest).group(:level_of_interest).count
    @job_count_by_city     = Job.order(:city).group(:city).count
  end


  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
