class ProjectsController < ApplicationController
   before_action :authenticate_user!

   def new
      @project = Project.new
   end

   def create
      @project = Project.new(project_params)
      @project.created_by = current_user.name
      if @project.save
         redirect_to @project
      else
         render 'new'
      end
   end

   def edit
   end

   def update
   end

   def show
      @project = Project.find(params[:id])
   end

   private

   def project_params
      params.require(:project).permit(:name, :job_num, :original_contract_amount, :terr_manager)
   end


end
