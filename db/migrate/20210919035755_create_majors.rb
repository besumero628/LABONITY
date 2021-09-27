class CreateMajors < ActiveRecord::Migration[5.2]
  def change
    create_table :majors do |t|
      t.integer :college_id, null: false
      t.string :faculity, null: false
      t.string :department, null: false
      t.string :section, null: false
      
      t.timestamps
    end
  end
end
