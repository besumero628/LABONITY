class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.string :name, null: false
      t.text :introduction, null: false

      t.timestamps
    end
  end
end
