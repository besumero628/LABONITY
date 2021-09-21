class CreatePapers < ActiveRecord::Migration[5.2]
  def change
    create_table :papers do |t|
      t.string :title
      t.text :abstract
      t.text :linkpath
      t.integer :laboratory_id

      t.timestamps
    end
  end
end
