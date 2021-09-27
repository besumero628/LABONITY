class CreateLabImages < ActiveRecord::Migration[5.2]
  def change
    create_table :lab_images do |t|
      t.integer :laboratory_id
      
      t.timestamps
    end
  end
end
