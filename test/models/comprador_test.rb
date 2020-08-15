require 'test_helper'

class CompradorTest < ActiveSupport::TestCase
  test "no deberia guardar un comprador sin informacion" do
    comprador = Comprador.new
    assert_not comprador.save
  end

  test "no deberia guardar un comprador sin nombre" do
    comprador = Comprador.new(nombre: nil)
    assert_not comprador.save
  end

  test "no deberia guardar comprador con nombre en blanco" do
    comprador = Comprador.new(nombre: "")
    assert_not comprador.save
  end

  test "no deberia guardar comprador con nombre mayor a 200 caracteres" do
    comprador = Comprador.new(nombre: "R" * 201)
    assert_not comprador.save
  end

  test "no deberia guardar comprador con nombre diferente a letras" do
    comprador = Comprador.new(nombre: "rey1david")
    assert_not comprador.save
  end

  test "deberia guardar nombre aunque tenga espacios enmedio" do
    comprador = Comprador.new(nombre: "rey     david")
    assert comprador.save
  end
end
