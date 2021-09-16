class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :title, null: false #タイトル
      t.text :body, null: false #本文
      t.datetime :release_at, null: false #リリース時刻

      t.timestamps
    end
  end
end
