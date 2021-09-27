class CreateAccesses < ActiveRecord::Migration[5.2]
  def change
    create_table :accesses do |t|
      t.references :organization, null: false, polymorphic: true
      t.string :postal_code, null: false
      t.integer :prefecture, null: false
      t.string :city, null: false
      t.string :address1, null: false
      t.string :address2
      t.float :latitude #緯度
      t.float :longitude #経度
      
      t.timestamps
    end
  end
end
