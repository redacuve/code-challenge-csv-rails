class CreateTransaccions < ActiveRecord::Migration[6.0]
  def change
    create_table :transaccions do |t|
      t.integer :total_items
      t.integer :item_id, null: false
      t.integer :vendedor_id, null: false
      t.integer :comprador_id, null: false

      t.timestamps
    end
  end
end
