class AddResumeRawToCandidates < ActiveRecord::Migration
  def change
  	add_column :candidates, :resume_raw, :text
  end
end
