class ChangeCloumnsNotnullAddLabMember < ActiveRecord::Migration[5.2]
  def change
    change_column :lab_members, :user_id, :integer, null: false
    change_column :lab_members, :laboratory_id, :integer, null: false
    change_column :lab_members, :post_id, :integer, null: false
  end
end
