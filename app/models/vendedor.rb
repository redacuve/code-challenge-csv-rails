class Vendedor < ApplicationRecord
  has_many :transaccions
  validates :nombre, presence: true, length: { maximum: 200 }
  validates :direccion, presence: true

  def self.import(archivo)
    CSV.foreach(archivo, headers: true) do |row|
      row_hash = row.to_hash
      unless self.exists?(nombre: row_hash["vendedor"], direccion: row_hash["direccion de vendedor"])
        self.create(nombre: row_hash["vendedor"], direccion: row_hash["direccion de vendedor"])
      end
    end
  end
end
