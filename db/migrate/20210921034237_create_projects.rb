class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.datetime :start_date
      t.datetime :end_date
      t.integer :funding
      t.string :position
      t.text :linkpath
      t.integer :laboratory_id, null: false

      t.timestamps
    end
  end
end
