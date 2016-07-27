class CharactersController < ApplicationController
  def index
  end

  def new
    @chapter = Chapter.find_by(id: params['format'].to_i)
    if @chapter.project.user == @current_user
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
    project = Project.find(params[:project_id].to_i)
    project.characters << @character
    chapter = Chapter.find(params[:chapter_id].to_i)
    chapter.characters << @character
    if @character.save
      flash[:success] = "Created a new character"
      redirect_to chapter.project
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
    params.require(:character).permit(:name, :description)
  end
end
