class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.integer :laboratory_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false

      t.timestamps
    end
  end
end
