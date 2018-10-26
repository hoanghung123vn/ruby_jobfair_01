class CareersController < ApplicationController
  before_action :find_career only: [:show, :edit, :update, :destroy]

  def index
    @careers = Career.page(params[:page]).per Settings.per_sheet
  end

  def show
    return if @career
    flash[:danger] = t ".not_found_careers"
    redirect_to root_path
  end

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

  def edit; end

  def update
    if @career.update career_params
      flash[:success] = t ".update_success"
      redirect_to @career
    else
      flash[:danger] = t ".update_fail"
      render :edit
    end
  end

  def destroy
    if @career.destroy
      flash[:success] = t ".delete_success"
      redirect_to careers_path
    else
      flash[:danger] = t ".delete_fail"
      redirect_to careers_path
    end
  end

  private

  def career_params
    params.require(:career).permit :name, :description
  end

  def find_career
    @career = Career.find_by id: params[:id]

    return if @career
    flash[:danger] = t ".not_found_careers"
    redirect_to root_path
  end
end
