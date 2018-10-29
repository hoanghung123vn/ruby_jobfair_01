module JobsHelper
  def jobs_new job
    @user = job.users.find_by role: "employeer"
  end
end
