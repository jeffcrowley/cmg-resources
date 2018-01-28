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
    @project = Project.find(params[:project_id])
    @rfi = Rfi.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @rfi = Rfi.find(params[:id])
    if @rfi.update_attributes(update_params)
      @project.history_events.create(user_id: current_user.id, project_id: @project.id, description: "#{current_user.name} edited
        RFI #{@rfi.rfi_num} for project #{@project.job_num} - #{@project.name} (#{@rfi.updated_at.strftime('%D')}).")
      redirect_to project_rfis_path(@project)
    else
      render 'edit'
    end
  end

  def show
  end

  def index
   @project = Project.find(params[:project_id])
   @rfis = @project.rfis
  end

  def destroy
    @project = Project.find(params[:project_id])
    @rfi = Rfi.find(params[:id])
    @project.history_events.create(user_id: current_user.id, project_id: @project.id, description: "#{current_user.name} deleted
        RFI #{@rfi.rfi_num} for project #{@project.job_num} - #{@project.name} (#{Time.now.strftime('%D')}).")
    @rfi.destroy
    redirect_to project_rfis_path(@project)
  end

  private

  def rfi_params
    params.require(:rfi).permit(:rfi_num, :gc_rfi_num, :description, :date_submitted, :date_answered, :scope_change, :status, :user_id)
  end

  def update_params
    params.require(:rfi).permit(:rfi_num, :gc_rfi_num, :description, :date_submitted, :date_answered, :scope_change, :status)
  end


end
