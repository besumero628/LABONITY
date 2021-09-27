class CreatePressReleases < ActiveRecord::Migration[5.2]
  def change
    create_table :press_releases do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.text :linkpath
      t.integer :laboratory_id, null: false

      t.timestamps
    end
  end
end
