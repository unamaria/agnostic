class Candidate < ActiveRecord::Base
	belongs_to :user
	has_many :applications
	has_many :positions, through: :applications

  has_attached_file :resume_pdf
  validates_attachment :resume_pdf, :content_type => { :content_type => "application/pdf" }

	before_create :create_nickname

	def create_resume_raw
		reader = PDF::Reader.new(resume_pdf.path)
		lines = reader.pages[0].text.lines.map(&:chomp)
		lines.slice!(0)
		# lines = array_to_html(lines)
		update_attribute(:resume_raw, lines)
	end

	def pdf_remove_first_line
		resume_raw.slice!(0)
	end

	private

		def create_nickname
			self.nickname = "Pomegranade #{self.id}"
		end

		# def array_to_html(array)
		# 	array = array.split(",")
		# 	array.each do |value|
		# 		value = "<p>#{value}</p>"
		# 	end
		# 	if array[0] == "<p></p>" then array.slice!(0) end
		# 	array.join(",")
		# end
end