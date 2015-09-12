class CreateRate < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :up
      t.integer :down
    end
  end
end
