module JobsHelper
  def jobs_new job
    @user = job.users.find_by role: "employeer"

    return if @user
    flash[:danger] = t ".user_employeer"
    redirect_to root_path
  end
end
