class Candidate < ActiveRecord::Base
	belongs_to :user
	has_many :applications
	has_many :positions, through: :applications

	before_create :create_nickname

	private

		def create_nickname
			self.nickname = "Pomegranade #{self.id}"
		end
end