class FollowsController < ApplicationController
#used from Hartl's microposts tutorial (and change order log app)
   def create
      @project = Project.find(params[:project_id])
      current_user.follow(@project)
      redirect_to @project
   end

   def destroy
      @project = Follow.find(params[:id]).project
      current_user.unfollow(@project)
      redirect_to @project
   end

end
