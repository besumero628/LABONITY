class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :title, null: false
      t.text :introduction
      t.datetime :start_time, null: false
      t.references :affiliation, null: false, polymorphic: true
      t.boolean :secret_status, default: false

      t.timestamps
    end
  end
end
