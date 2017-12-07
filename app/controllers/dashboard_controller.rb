class DashboardController < ApplicationController
   before_action :authenticate_user!

  def main
   @user = current_user
   @followed_projects = @user.projects
  end

end
