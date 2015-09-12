class CreateCandidate < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :nickname
      t.string :email
      t.string :github_username
      t.references :user, index: true
      t.timestamps
    end
  end
end
