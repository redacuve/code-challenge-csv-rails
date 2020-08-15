class CreateCompradors < ActiveRecord::Migration[6.0]
  def change
    create_table :compradors do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
