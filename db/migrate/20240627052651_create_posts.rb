class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :contents, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :ship_charge_id, null: false
      t.integer :ship_from_id, null: false
      t.integer :ship_long_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
