class AddLoginIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :login_id, :string
  end
end
