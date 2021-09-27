class CreateLabLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :lab_links do |t|
      t.string :name
      t.text :linkpath
      t.integer :laboratory_id

      t.timestamps
    end
  end
end
