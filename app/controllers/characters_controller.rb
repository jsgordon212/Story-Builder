class CharactersController < ApplicationController
  def index
    if params[:project_id]
      @characters = Character.where(project_id: params[:project_id])
      @project = Project.find(params[:project_id])

      @project.user == current_user ? @creator = true : @creator = false
    else
      @chapter = Chapter.find_by(id: params[:chapter_id])
      @project = @chapter.project
      @characters = @chapter.characters
    end
    if request.xhr?
      render '_characters', layout: false, locals: {characters: @characters}
    end
  end

  def new
    @project = Project.find_by(id: params[:project_id])
    if @project
      if @project.user == @current_user
        @character = Character.new
      else
        redirect_to root_path
      end
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
    params.require(:character).permit(:name, :description, :chapter_id, :project_id)
  end
end
