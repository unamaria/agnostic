class PositionsController < ApplicationController
	def index
		@positions = Position.paginate(page: params[:page])
	end

	def show
		@position = Position.find params[:id]
	end
end