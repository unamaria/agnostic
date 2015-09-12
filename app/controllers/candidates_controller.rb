class CandidatesController < ApplicationController
	def index
		@candidates = Candidate.paginate(page: params[:page])
	end

	def show
	end
end