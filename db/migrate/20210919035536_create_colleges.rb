class CreateColleges < ActiveRecord::Migration[5.2]
  def change
    create_table :colleges do |t|
      t.string :name, null: false
      t.boolean :official_mark_status, default: false

      t.timestamps
    end
  end
end
