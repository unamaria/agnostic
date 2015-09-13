class AddAttachmentResumePdfToCandidates < ActiveRecord::Migration
  def self.up
    change_table :candidates do |t|
      t.attachment :resume_pdf
    end
  end

  def self.down
    remove_attachment :candidates, :resume_pdf
  end
end
