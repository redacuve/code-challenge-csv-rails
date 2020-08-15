require 'test_helper'

class TransaccionTest < ActiveSupport::TestCase
  test "no deberia guardar una transacion sin informacion" do
    transaccion = Transaccion.new
    assert_not transaccion.save
  end

  test "no deberia guardar una transaccion con total_items en blanco" do
    transaccion = Transaccion.new(total_items: "")
    assert_not transaccion.save
  end

  test "no deberia guardar una transacion con total_items diferente a numero" do
    transaccion = Transaccion.new(total_items: "X")
    assert_not transaccion.save
  end

  test "no deberia guardar una transacion con total_items igual a 0" do
    transaccion = Transaccion.new(total_items: 0)
    assert_not transaccion.save
  end

  test "deberia guardar una transaccion completa" do
    c = Comprador.create(nombre: "Rey")
    v = Vendedor.create(nombre: "David", direccion: "calle falsa #123")
    i = Item.create(descripcion: "descripcion del item", precio: 10)
    transaccion = Transaccion.new(total_items: 1, item_id: i.id, vendedor_id: v.id, comprador_id: c.id)
    assert transaccion.save
  end
end
