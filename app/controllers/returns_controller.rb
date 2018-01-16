class ReturnsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @return = @project.returns.build
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
  end

  def show
  end

  def index
   @project = Project.find(params[:project_id])
   @returns = @project.returns
  end

  private

  def return_params
    params.require(:return).permit(:jobsite_street, :jobsite_city, :jobsite_state, :jobsite_zip, :distro_center, :shipper, :pallet_count, :piece_count, :user_id)
  end

end
