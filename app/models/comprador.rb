class Comprador < ApplicationRecord
  require 'csv'

  has_many :transaccions

  def self.import(archivo)
    CSV.foreach(archivo, headers: true) do |row|
      row_hash = row.to_hash
      unless self.exists?(nombre: row_hash["comprador"])
        self.create(nombre: row_hash["comprador"])
      end
    end
  end
end
