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
		@project = Project.find_by(id: params["format"].to_i)
		if @project.user = @current_user
			@chapter = Chapter.new
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

		if @chapter.project.user == @current_user #excessive, probably
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
