class RfisController < ApplicationController
  def new
  end

  def edit
  end

  def show
  end

  def index
   @project = Project.find(params[:project_id])
   @rfis = @project.rfis
  end
end
