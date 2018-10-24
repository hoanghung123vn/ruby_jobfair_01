class CurriculumVitaesController < ApplicationController
  before_action :logged_in_user, :candidate_user, only: %i(new create)

  def new
    @curriculum_vitae = current_user.curriculum_vitaes.new
  end

  def create
    @curriculum_vitae = current_user.curriculum_vitaes.build cv_params

    if @curriculum_vitae.save
      @curriculum_vitae.user_curriculum_vitaes.create! user_id: current_user.id,
       curriculum_vitae_id: @curriculum_vitae.id
      flash[:success] = t ".success"
      redirect_to root_url
    else
      flash[:danger] = t ".fail"
      render :new
    end
  end

  def show
    @curriculum_vitae = CurriculumVitae.find_by id: params[:id]

    if @curriculum_vitae
      @user = @curriculum_vitae.users.find_by role: "candidate"
    else
      flash[:danger] = t ".not_found"
      redirect_to root_path
    end
  end

  private

  def cv_params
    params.require(:curriculum_vitae).permit :target, :skill, :level,
      :experience, :language, :note
  end

  def candidate_user
    return if current_user.candidate?
    flash[:danger] = t ".permit"
    redirect_to root_url
  end
end
