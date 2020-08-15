require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "no deberia guardar un item sin informacion" do
    item = Item.new
    assert_not item.save
  end

  test "no deberia guardar un item sin descripcion" do
    item = Item.new(precio: 10)
    assert_not item.save
  end

  test "no deberia guardar un item sin precio" do
    item = Item.new(descripcion: "descripcion del item")
    assert_not item.save
  end

  test "no deberia guardar un item con descripcion en blanco" do
    item = Item.new(descripcion: "", precio: 10)
    assert_not item.save
  end

  test "no deberia guardar un item con un precio que no sea numero" do
    item = Item.new(descripcion: "descripcion del item", precio: "X")
    assert_not item.save
  end

  test "no deberia guardar con un precio en 0" do
    item = Item.new(descripcion: "descripcion", precio: 0)
    assert_not item.save
  end
end
