class CreateApplication < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :status
      t.references :position, index: true
      t.references :candidate, index: true
      t.timestamps
    end
  end
end
