class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.text :abstract, null: false
      t.text :linkpath
      t.integer :laboratory_id

      t.timestamps
    end
  end
end
