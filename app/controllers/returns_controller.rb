class ReturnsController < ApplicationController

  def new
    @project = Project.find(params[:project_id])
    @return = @project.returns.build
    @pallet_count = params[:pallet_count].to_i
    @pallet_count.times { @return.pallets.build }
  end

  def create
    @project = Project.find(params[:project_id])
    @return = @project.returns.build(return_params)
    if @return.save
      @project.history_events.create(user_id: current_user.id, project_id: @project.id, description: "#{current_user.name} added
        a new return shipment to project #{@project.job_num} - #{@project.name} (#{@return.created_at.strftime('%D')}).")
      redirect_to @project
    else
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @return = Return.find(params[:id])
    @pallets = @return.pallets
  end

  def update
    @project = Project.find(params[:project_id])
    @return = Return.find(params[:id])
    if @return.update_attributes(update_params)
      @project.history_events.create(user_id: current_user.id, project_id: @project.id, description: "#{current_user.name} edited
        a return shipment for project #{@project.job_num} - #{@project.name} (#{@return.created_at.strftime('%D')}).")
      redirect_to project_returns_path(@project)
    else
      render 'edit'
    end
  end

  def show
  end

  def index
   @project = Project.find(params[:project_id])
   @returns = @project.returns
  end

  private

  def return_params
    params.require(:return).permit(:jobsite_street, :jobsite_city, :jobsite_state, :jobsite_zip, :distro_center, :shipper, :pallet_count, :user_id, pallets_attributes: [:piece_count])
  end

  def update_params
    params.require(:return).permit(:jobsite_street, :jobsite_city, :jobsite_state, :jobsite_zip, :distro_center, :shipper, :pallet_count, pallets_attributes: [:id, :piece_count])
  end

end
