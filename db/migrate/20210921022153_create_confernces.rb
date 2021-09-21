class CreateConfernces < ActiveRecord::Migration[5.2]
  def change
    create_table :confernces do |t|
      t.string :name
      t.string :title
      t.text :abstract
      t.text :linkpath
      t.integer :laboratory_id

      t.timestamps
    end
  end
end
