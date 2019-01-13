class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.integer :owner_id, foreign_key: true
      t.integer :assigned_id

      t.timestamps
    end

    
  end
end
