class ChangeNameColumnOnPost < ActiveRecord::Migration[5.2]
  def change
    change_column_null :posts, :name, false, 0
    change_column_default :posts, :name, from: nil, to: 0
  end
end
