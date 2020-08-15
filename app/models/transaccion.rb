class Transaccion < ApplicationRecord
  belongs_to :item_id
  belongs_to :vendedor_id
  belongs_to :comprador_id
end
