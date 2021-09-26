class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :company_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.text :link_path

      t.timestamps
    end
  end
end
