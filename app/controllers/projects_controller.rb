class ProjectsController < ApplicationController
   before_action :authenticate_user!

   def new
      @project = Project.new
   end

   def create
      @project = Project.new(project_params)
      @project.created_by = current_user.name
      if @project.save
         @project.history_events.create(user_id: current_user.id, description: "#{current_user.name} created project #{@project.job_num} - #{@project.name} (#{@project.created_at.strftime('%D')}).")
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
      @history_events = @project.history_events.order(created_at: :desc)
   end

   private

   def project_params
      params.require(:project).permit(:name, :job_num, :original_contract_amount, :terr_manager)
   end


end
