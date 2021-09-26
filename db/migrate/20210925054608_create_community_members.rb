class CreateCommunityMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :community_members do |t|
      t.integer :user_id, null: false
      t.integer :community_id, null: false
      t.boolean :owner_status, default: false
      t.boolean :permit_status, default: false

      t.timestamps
    end
  end
end
