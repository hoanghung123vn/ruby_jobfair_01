class UserCurriculumVitaesController < ApplicationController
  before_action :logged_in_user, :find_user_cv, only: :create

  def create
    @user_cv = @user_job.user_curriculum_vitaes.build user_cv_params

    if @user_cv.save
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".failed"
    end
    redirect_to current_user
  end

  private

  def find_user_cv
    @user_job = User.find_by id: params[:user_id]
    @user_curriculum_vitae = @user_job.curriculum_vitaes.find_by id:
      params[:user_curriculum_vitae][:curriculum_vitae_id]

    return unless @user_curriculum_vitae
    flash[:danger] = t ".select_another_cv"
    redirect_to root_url
  end

  def user_cv_params
    params.require(:user_curriculum_vitae).permit :user_id, :curriculum_vitae_id
  end
end
