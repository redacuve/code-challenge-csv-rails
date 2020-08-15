class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :descripcion
      t.decimal :precio

      t.timestamps
    end
  end
end
