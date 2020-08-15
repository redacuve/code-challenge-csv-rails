class StaticPagesController < ApplicationController
  def index
  end

  def procesar

  end

  def procesar_csv
    puts "PROCESANDO..."
    archivo = params[:archivo].tempfile
    content_type = params[:archivo].content_type
    puts params[:archivo].content_type
    if archivo.respond_to?(:read) && content_type == 'text/csv'
      puts archivo.read
    end
  end
end
