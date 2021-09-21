class CreatePapers < ActiveRecord::Migration[5.2]
  def change
    create_table :papers do |t|
      t.string :title, null: false
      t.text :abstract, null: false
      t.text :linkpath
      t.integer :laboratory_id, null: false

      t.timestamps
    end
  end
end
