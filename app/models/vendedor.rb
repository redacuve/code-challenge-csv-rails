class Vendedor < ApplicationRecord
  has_many :transaccions

  def self.import(archivo)
    CSV.foreach(archivo, headers: true) do |row|
      row_hash = row.to_hash
      unless self.exists?(nombre: row_hash["vendedor"], direccion: row_hash["direccion de vendedor"])
        self.create(nombre: row_hash["vendedor"], direccion: row_hash["direccion de vendedor"])
      end
    end
  end
end
