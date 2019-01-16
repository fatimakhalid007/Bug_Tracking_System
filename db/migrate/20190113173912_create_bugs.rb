class CreateBugs < ActiveRecord::Migration[5.0]
  def change
    create_table :bugs do |t|
      t.string :bug_title
      t.string :bug_description
      t.date :bug_deadline
      t.string :bug_type
      t.string :bug_status
      t.integer :add_id
      t.integer :assign_id
      t.integer :project_id

      t.timestamps
    end
  end
end
