class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.references :deliverable, null: false, polymorphic: true
      t.integer :user_id
      t.string :name
      t.boolean :permit_status, default: false

      t.timestamps
    end
  end
end
