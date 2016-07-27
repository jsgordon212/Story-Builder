class PlotPointsController < ApplicationController
	def index
		@project = Project.find_by_id params[:project_id]
		@plot_points = @project.plot_points

		 @subplots = @plot_points.where(main_plot: false)
		 @main_plots = @plot_points.where(main_plot: true)
	end

	def new
		@project = Project.find_by_id params[:project]
		if @project.user = @current_user
			@plot_point = PlotPoint.new
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
