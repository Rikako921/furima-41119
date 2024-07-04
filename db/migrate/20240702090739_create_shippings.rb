class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|
      t.integer    :shipping_id     , null: false
      t.timestamps
    end
  end
end
