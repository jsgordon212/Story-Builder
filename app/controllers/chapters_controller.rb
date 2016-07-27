class ChaptersController < ApplicationController
	def index
		@chapters = Chapter.all
	end

	def show
		@chapter = Chapter.find(params[:id])

		if @chapter == nil
			redirect_to root_url
		end
	end

	def new
		# binding.pry
		if logged_in?
			@project = Project.find_by(id: params["format"].to_i)
			@chapter = Chapter.new()
		else
			redirect_to root_url
		end
	end

	def create
		#possible login redirect, but can you force a post?
		project = Project.find(params[:project_id])
		@chapter = project.chapters.build(chapter_params) #check

		if @chapter.save
			flash[:success] = "Created a new chapter"

			redirect_to project # check
		else
			@errors = @chapter.errors.full_messages
			render 'new'
		end
	end

	def destroy
		@chapter = Chapter.find_by_id params[:id]

		@project = @chapter.project

		if @chapter.project.user == @current_user
			@chapter.destroy
			redirect_to @project
		else
			redirect_to '/'
		end

	end

	private

	def chapter_params
		params.require(:chapter).permit(:chapter_number, :chapter_title, :project_id)
	end
end
