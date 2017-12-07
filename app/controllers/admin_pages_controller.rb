class AdminPagesController < ApplicationController
  def main
   @users = User.all
   @projects = Project.all
   @follows = Follow.all
  end

  def users
   @users = User.all
  end

  def projects
   @projects = Project.all
  end

  def follows
   @follows = Follow.all
  end
end
