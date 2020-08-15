require 'test_helper'

class VendedorTest < ActiveSupport::TestCase
  test "no deberia guardar un vendedor sin informacion" do
    vendedor = Vendedor.new
    assert_not vendedor.save
  end

  test "no deberia guardar un vendedor sin nombre" do
    vendedor = Vendedor.new(direccion: 'calle dalsa #123')
    assert_not vendedor.save
  end

  test "no deberia guardar un vendedor sin direccion" do
    vendedor = Vendedor.new(nombre: 'Rey David')
    assert_not vendedor.save
  end

  test "no deberia guardar vendedor con campos en blanco" do
    vendedor = Vendedor.new(nombre: "", direccion: "")
    assert_not vendedor.save
  end

  test "no deberia guardar vendedor con nombre en blanco" do
    vendedor = Vendedor.new(nombre: "", direccion: "Calle falsa #123")
    assert_not vendedor.save
  end

  test "no deberia guardar vendedor con direccion en blanco" do
    vendedor = Vendedor.new(nombre: "Rey David", direccion: "")
    assert_not vendedor.save
  end

  test "no deberia guardar vendedor con nombre mayor a 200 caracteres" do
    vendedor = Vendedor.new(nombre: "R"*200, direccion: "")
    assert_not vendedor.save
  end
end
