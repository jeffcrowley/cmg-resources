class ReturnsController < ApplicationController
  def new
  end

  def edit
  end

  def show
  end

  def index
   @project = Project.find(params[:project_id])
   @returns = @project.returns
  end
end
