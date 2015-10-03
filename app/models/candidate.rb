class Candidate < ActiveRecord::Base
	belongs_to :user
	has_many :applications
	has_many :positions, through: :applications

  has_attached_file :resume_pdf
  validates_attachment :resume_pdf, :content_type => { :content_type => "application/pdf" }

	before_create :create_nickname
	# before_create :create_resume_raw input must be an IO-like object or a filename
	# before_update :create_resume_raw RECURSIVE


		def create_resume_raw
			reader = PDF::Reader.new(resume_pdf.path)
			lines = reader.pages[0].text.lines.map(&:chomp)
			lines.slice!(0)
			lines_html = to_html(lines)
			update_attribute(:resume_raw, lines_html)
		end
	private

		def create_nickname
			self.nickname = "Pomegranade #{self.id}"
		end

		def to_html(lines)
			headings = %w(education experience projects languages skills)
			lines.each_with_index do |value, index| 
				if headings.include?(value.downcase)
					lines[index] = "<strong>#{value}</strong>" 
				end
			end
			lines_html = lines.map { |value| value = "<p>#{value}</p>" }
			lines_html = lines_html.keep_if { |value| value != "<p></p>" }
			lines_html.join("")
		end
end