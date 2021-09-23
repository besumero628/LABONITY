class CreateLaboratories < ActiveRecord::Migration[5.2]
  def change
    create_table :laboratories do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.references :organization, null: false, polymorphic: true
      t.integer :major_id
      t.boolean :official_mark_status, default: false
      t.boolean :close_status, default: false

      t.timestamps
    end
  end
end
