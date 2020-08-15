class StaticPagesController < ApplicationController
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
      redirect_to root_url
    else
      render :procesar
    end
  end
end
