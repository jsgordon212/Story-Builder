class PlotPointsController < ApplicationController
	def new
		@chapter = Chapter.find_by_id params["format"].to_i

		if @chapter.project.user = @current_user
			@plot_point = PlotPoint.new
		else
			redirect_to @chapter
		end
	end

	def create

		@chapter = Chapter.find_by_id params["chapter_id"]

		if @chapter.project.user == @current_user
			if params[:plot_point][:main_plot] == "0"
				params[:plot_point][:main_plot] == false
			else
				params[:plot_point][:main_plot] == true
			end
			@plot_point = @chapter.plot_points.build(plot_points_params)

			if @plot_point.save
				redirect_to @chapter
			else
				render 'new'
			end
		else
			redirect_to @chapter
		end


	end

	private

	def plot_points_params
		params.require(:plot_point).permit(:main_plot, :description, :chapter)
	end
end
