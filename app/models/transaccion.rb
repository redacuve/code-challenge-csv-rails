class Transaccion < ApplicationRecord
  belongs_to :item
  belongs_to :vendedor
  belongs_to :comprador
  validates :total_items, presence: true, numericality: { greater_than: 0 }

  def self.import(archivo)
    CSV.foreach(archivo, headers: true, col_sep: "\t") do |row|
      row_hash = row.to_hash
      self.create(total_items: row_hash["total de items"],
                  item_id: Item.find_by(descripcion: row_hash["descripcion del item"],
                                        precio: row_hash["precio del item"]).id,
                  vendedor_id: Vendedor.find_by(nombre: row_hash["vendedor"]).id,
                  comprador_id: Comprador.find_by(nombre: row_hash["comprador"]).id)
    end
  end
end
