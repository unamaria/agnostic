class CandidatesController < ApplicationController

	def index
		@candidates = Candidate.paginate(page: params[:page])
	end

	def show
		@candidate = Candidate.find params[:id]
	end

	def new
		@candidate = Candidate.new
		@positions = Position.all.map { |value| [ value, value.title ] }
	end

	def create
		@candidate = Candidate.new candidate_params
		if @candidate.save
			flash[:success] = "Candidate successfully created."
			redirect_to candidate_path @candidate
		else
			flash.now[:danger] = "Candidate couldn't be saved"
			render 'new'
		end
	end

	private

		def candidate_params
			params.require(:candidate).permit(:name, :email, :github_username, :resume_pdf)
		end

end