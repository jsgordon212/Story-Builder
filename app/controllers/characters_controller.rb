class CharactersController < ApplicationController
  def index
    @characters = Character.where(project_id: params[:project_id])
  end

  def new
  
    @project = Project.find_by(id: params[:project])
    if @project.user == @current_user
      @character = Character.new
    else
      redirect_to root_path
    end
  end

  def show
  end

  def edit
  end

  def create

    @character = Character.new(character_params)

    if @character.save
      flash[:success] = "Created a new character"
      redirect_to @character.project
    else
      @errors = @character.errors.full_messages
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private

  def character_params
    params.require(:character).permit(:name, :description, :project_id)
  end
end
