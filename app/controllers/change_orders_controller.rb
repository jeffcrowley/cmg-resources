class ChangeOrdersController < ApplicationController
  def new
  end

  def edit
  end

  def show
  end

  def index
   @project = Project.find(params[:project_id])
   @change_orders = @project.change_orders
  end
end
