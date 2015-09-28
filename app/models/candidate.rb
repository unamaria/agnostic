class Candidate < ActiveRecord::Base
	belongs_to :user
	has_many :applications
	has_many :positions, through: :applications

  has_attached_file :resume_pdf
  validates_attachment :resume_pdf, :content_type => { :content_type => "application/pdf" }

	before_create :create_nickname

	private

		def create_nickname
			self.nickname = "Pomegranade #{self.id}"
		end
end