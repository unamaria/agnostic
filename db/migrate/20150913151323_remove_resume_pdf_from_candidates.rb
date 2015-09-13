class RemoveResumePdfFromCandidates < ActiveRecord::Migration
  def change
  	remove_column :candidates, :resume_pdf, :string
  end
end
