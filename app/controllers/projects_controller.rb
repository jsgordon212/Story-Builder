class ProjectsController < ApplicationController

  def index
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find_by_id params[:id]
  end

  def edit
    if @project.user == @current_user
      render 'edit'
    else
      redirect_to '/'
    end
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = @current_user.id if @current_user

    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def update
  @project = Project.find_by_id params[:id]

  if @project.update(project_params)
    redirect_to @project
  else
    render 'edit'
  end
end

def destroy
  @project = Project.find_by_id params[:id]
  if @project.user == @current_user
    @project.destroy
    redirect_to @current_user
  else
    redirect_to '/'
  end
end

private

  def project_params
    params.require(:project).permit(:user_id, :title, :summary)
  end

end
