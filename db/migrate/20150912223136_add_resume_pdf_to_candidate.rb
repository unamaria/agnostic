class AddResumePdfToCandidate < ActiveRecord::Migration
  def change
  	add_column :candidates, :resume_pdf, :string
  end
end
