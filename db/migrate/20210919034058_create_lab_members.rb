class CreateLabMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :lab_members do |t|
      t.integer :user_id
      t.integer :laboratory_id
      t.integer :post_id
      t.boolean :authority_status, default: false
      t.boolean :edit_status, default: false
      t.boolean :enrolled_status, default: true
      t.boolean :main_status, default: true
      t.boolean :flex_status, default: false
      t.boolean :permit_status, default: false

      t.timestamps
    end
  end
end
