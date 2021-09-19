class CreateLabImages < ActiveRecord::Migration[5.2]
  def change
    create_table :lab_images do |t|
      t.integer :album_id
      t.boolean :top_status, default: false
      
      t.timestamps
    end
  end
end
