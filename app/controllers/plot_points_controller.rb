class PlotPointsController < ApplicationController
	def index
		if params[:project_id]
			@project = Project.find_by(id: params[:project_id])
			@plot_points = @project.plot_points
		else
			@chapter = Chapter.find_by(id: params[:chapter_id])
			@project = @chapter.project
			@plot_points = @chapter.plot_points
		end
		@subplots = @plot_points.where(main_plot: false)
		@main_plots = @plot_points.where(main_plot: true)

		@project.user == current_user ? @creator = true : @creator = false
		if request.xhr?
      render '_plot_points', layout: false, locals: {main_plots: @main_plots, subplots: @subplots}
		end

	end

	def new
		@project = Project.find_by(id: params[:project_id])
		if @project
			if @project.user != @current_user
				redirect_to @chapter
			else
				@plot_point = PlotPoint.new
				if request.xhr?
          render '_form', layout: false
        end
			end
		else
			redirect_to @chapter
		end
	end

	def create
		@project = Project.find_by_id plot_points_params[:project_id]
		@plot_point = PlotPoint.new(plot_points_params)

		if params[:plot_point][:main_plot] == "0"
			params[:plot_point][:main_plot] == false
		else
			params[:plot_point][:main_plot] == true
		end
		if @project.user == @current_user
			if @plot_point.save
				redirect_to @plot_point.project
			else
				render 'new'
			end
		else
			redirect_to @plot_point.project
		end
	end

	private

	def plot_points_params
		params.require(:plot_point).permit(:main_plot, :description, :chapter_id, :project_id)
		#binding.pry
	end
end
