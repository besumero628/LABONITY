class CreateRsses < ActiveRecord::Migration[5.2]
  def change
    create_table :rsses do |t|
      t.text :url
      t.string :name
      t.text :introduction

      t.timestamps
    end
  end
end
