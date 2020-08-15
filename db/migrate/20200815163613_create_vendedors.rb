class CreateVendedors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendedors do |t|
      t.string :nombre
      t.string :direccion

      t.timestamps
    end
  end
end
