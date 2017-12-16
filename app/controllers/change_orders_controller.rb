class ChangeOrdersController < ApplicationController
  def new
  end

  def edit
  end

  def show
   @project = Project.find(params[:project_id])
   @change_order = ChangeOrder.find(params[:id])
  end

  def index
   @project = Project.find(params[:project_id])
   @change_orders = @project.change_orders
  end
end
