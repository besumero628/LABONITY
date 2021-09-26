class CreateCommunityMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :community_messages do |t|
      t.integer :user_id
      t.integer :community_id
      t.text :body

      t.timestamps
    end
  end
end
