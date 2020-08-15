class Item < ApplicationRecord
  require 'csv'
  has_many :transaccions

  def self.import(archivo)
    CSV.foreach(archivo, headers: true) do |row|
      row_hash = row.to_hash
      unless self.exists?(descripcion: row_hash["descripcion del item"], precio: row_hash["precio del item"])
        self.create(descripcion: row_hash["descripcion del item"], precio: row_hash["precio del item"])
      end
    end
  end
end
