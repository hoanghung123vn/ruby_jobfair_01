class UsersController < ApplicationController
  before_action :find_user, only: :show

  def new
    @user = User.new
  end

  def show; end

  def create
    @user = User.new user_params

    if @user.save
      flash.now[:info] = t ".success"
      redirect_to
    else
      flash.now[:danger] = t ".error"
      render :new
    end
  end

  private

  def find_user
    @user = User.find_by id: params[:id]

    return if @user
    flash[:danger] = t ".not_found"
    redirect_to
  end

  def user_params
    params.require(:user).permit :role, :name, :email, :birthday, :gender,
      :phone, :address, :password, :password_confirmation
  end
end
