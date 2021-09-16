class CreateRssChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :rss_choices do |t|
      t.integer :user_id
      t.integer :rss_id
      
      t.timestamps
    end
  end
end
