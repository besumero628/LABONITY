class CreateConfernces < ActiveRecord::Migration[5.2]
  def change
    create_table :confernces do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.text :abstract, null: false
      t.text :linkpath
      t.integer :laboratory_id

      t.timestamps
    end
  end
end
