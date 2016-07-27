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
			@chapter = Chapter.new(project_id: @project.id)
		else
			redirect_to root_url
		end
	end

	def create
		#possible login redirect, but can you force a post?
		# binding.pry
		@chapter = Chapter.new(chapter_params) #check



		if @chapter.save
			flash[:success] = "Created a new chapter"

			redirect_to root_url # check
		else
			@errors = @chapter.errors.full_messages
			render 'new'
		end
	end

	private

	def chapter_params
		params.require(:chapter).permit(:chapter_number, :chapter_title, :project)
	end
end
