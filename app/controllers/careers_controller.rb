class CareersController < ApplicationController
  def index; end

  def new
    @career = Career.new
  end

  def create
    @career = Career.new career_params

    if @career.save
      flash[:success] = t ".create_career_success"
      redirect_to @career
    else
      flash[:danger] = t ".error"
      render :new
    end
  end

  def show; end

  def edit; end

  def update; end

  def destroy; end

  private

  def career_params
    params.require(:career).permit :name, :description
  end
end
