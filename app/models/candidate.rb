class Candidate < ActiveRecord::Base
	belongs_to :user
	has_many :applications
	has_many :positions, through: :applications

	attr_accessible :resume_pdf
  has_attached_file :resume_pdf, styles: {thumbnail: "60x60#"}
  validates_attachment_content_type :resume_pdf, content_type: { content_type: "application/pdf" }

	before_create :create_nickname

	private

		def create_nickname
			self.nickname = "Pomegranade #{self.id}"
		end
end