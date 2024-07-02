class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :contents, null: false
      t.integer :price, null: false

      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :schedule_id, null: false

      
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
