class Transaccion < ApplicationRecord
  belongs_to :item
  belongs_to :vendedor
  belongs_to :comprador
end
