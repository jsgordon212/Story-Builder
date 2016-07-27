class ChaptersController < ApplicationController
	def index
		@chapters = Chapter.all
	end

	def show
		@chapter = Chapter.find(params[:id])

		@main_plots = @chapter.plot_points.where(main_plot: true)

		@sub_plots = @chapter.plot_points.where(main_plot: false)

		if @chapter == nil
			redirect_to root_url
		end
	end

	def edit
		@chapter = Chapter.find(params[:id])

		@project = @chapter.project

		if @chapter.project.user == @current_user
			render 'edit'
		else
			redirect_to @chapter.project
		end
	end

	def update
		@chapter = Chapter.find_by_id params[:id]

		if @chapter.update(chapter_params)
			redirect_to @chapter.project
		else
			render 'edit'
		end
	end

	def new
		@project = Project.find_by(id: params[:project_id])
		if @project.user == @current_user
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

			redirect_to @chapter # check
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
		params.require(:chapter).permit(:chapter_number, :chapter_title, :project_id, :summary)
	end
end
