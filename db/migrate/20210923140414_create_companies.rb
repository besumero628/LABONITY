class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.boolean :official_mark_status
      t.boolean :close_status
      t.text :linkpath

      t.timestamps
    end
  end
end
