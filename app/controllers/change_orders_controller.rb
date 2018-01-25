class ChangeOrdersController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @change_order = @project.change_orders.build
  end

  def create
    @project = Project.find(params[:project_id])
    @change_order = @project.change_orders.build(change_order_params)
    if @change_order.save
      @project.history_events.create(user_id: current_user.id, project_id: @project.id, description: "#{current_user.name} created
        Change Order #{@change_order.co_num} - #{@change_order.name}, for project #{@project.job_num} - #{@project.name} (#{@change_order.created_at.strftime('%D')}).")
      redirect_to @project
    else
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @change_order = ChangeOrder.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @change_order = ChangeOrder.find(params[:id])
    if @change_order.update_attributes(update_params)
      @project.history_events.create(user_id: current_user.id, project_id: @project.id, description: "#{current_user.name} edited
        Change Order #{@change_order.co_num} - #{@change_order.name}, for project #{@project.job_num} - #{@project.name} (#{@change_order.updated_at.strftime('%D')}).")
      redirect_to project_change_orders_path(@project)
    else
      render 'edit'
    end
  end

  def show
   @project = Project.find(params[:project_id])
   @change_order = ChangeOrder.find(params[:id])
  end

  def index
   @project = Project.find(params[:project_id])
   @change_orders = @project.change_orders
  end

  private

  def change_order_params
    params.require(:change_order).permit(:co_num, :gc_co_num, :name, :date_submitted, :date_received, :initial_co_value, :labor_value,
      :approved_co_value, :status, :user_id )
  end

  def update_params
    params.require(:change_order).permit(:co_num, :gc_co_num, :name, :date_submitted, :date_received, :initial_co_value, :labor_value,
      :approved_co_value, :status)
  end
end
