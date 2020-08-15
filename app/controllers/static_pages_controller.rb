class StaticPagesController < ApplicationController
  require 'csv'
  def index
  end

  def procesar

  end

  def procesar_csv
    archivo = params[:archivo].tempfile
    content_type = params[:archivo].content_type
    if archivo.respond_to?(:read) && content_type == 'text/csv'
      Comprador.import(archivo)
      Item.import(archivo)
      Vendedor.import(archivo)
      Transaccion.import(archivo)
      filas_procesadas = CSV.parse(archivo).size - 1
      flash[:success] = "Total de Transacciones procesadas: #{filas_procesadas}"
      redirect_to root_url
    else
      flash[:error] = "Solo se permiten archivos con extension .CSV"
      render :procesar
    end
  end

end
