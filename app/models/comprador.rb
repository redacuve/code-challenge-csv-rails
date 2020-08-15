class Comprador < ApplicationRecord
  has_many :transaccions
  REGEX_VALIDA_NOMBRE = /\A[a-z]+(\s*|[a-z]*)*\z/i.freeze
  validates :nombre, presence: true, length: { maximum: 200 }, format: { with: REGEX_VALIDA_NOMBRE }

  def self.import(archivo)
    CSV.foreach(archivo, headers: true) do |row|
      row_hash = row.to_hash
      unless self.exists?(nombre: row_hash["comprador"])
        self.create(nombre: row_hash["comprador"])
      end
    end
  end
end
