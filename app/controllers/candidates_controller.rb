class CandidatesController < ApplicationController
	def index
		@candidates = Candidate.paginate(page: params[:page])
	end
end