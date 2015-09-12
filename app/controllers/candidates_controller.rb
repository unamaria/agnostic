class CandidatesController < ApplicationController
	def index
		@candidates = Candidate.paginate(page: params[:page])
	end

	def show
		@candidate = Candidate.find params[:id]
	end

	def new
		@candidate = Candidate.new
	end

	def create
	end
end