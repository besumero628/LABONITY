class CreateCompanyImages < ActiveRecord::Migration[5.2]
  def change
    create_table :company_images do |t|
      t.integer :company_id, null: false

      t.timestamps
    end
  end
end
