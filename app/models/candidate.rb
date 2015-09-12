class Candidate < ActiveRecord::Base
	belongs_to :user
	has_many :applications
	has_many :positions, through: :applications
	has_one :rate
end