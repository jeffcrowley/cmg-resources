class RfisController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @rfi = @project.rfis.build
  end

  def create
    @project = Project.find(params[:project_id])
    @rfi = @project.rfis.build(rfi_params)
    if @rfi.save
      @project.history_events.create(user_id: current_user.id, project_id: @project.id, description: "#{current_user.name} added
        RFI #{@rfi.rfi_num} to project #{@project.job_num} - #{@project.name} (#{@rfi.created_at.strftime('%D')}).")
      redirect_to @project
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def index
   @project = Project.find(params[:project_id])
   @rfis = @project.rfis
  end

  private

  def rfi_params
    params.require(:rfi).permit(:rfi_num, :gc_rfi_num, :description, :date_submitted, :date_answered, :scope_change, :status, :user_id)
  end

end
