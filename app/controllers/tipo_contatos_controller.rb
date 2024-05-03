class TipoContatosController < ApplicationController
  def index
    @tipo_contato = TipoContato.all
  end

  def show
    @tipo_contato = TipoContato.find(tipo_contato_params[:codigo_tipo_contato])
  end

  def new
    @tipo_contato = TipoContato.new
  end

  # def create
  #   @tipo_contato = TipoContato.new(params[:descricao])
  #   if @tipo_contato.save
  #     flash[:success] = 'TipoContato successfully created'
  #     redirect_to @tipo_contato
  #   else
  #     flash[:error] = 'Something went wrong'
  #     render 'new'
  #   end
  # end

  private

  def tipo_contato_params
    params.require(:tipo_contato).permit(:descricao)
  end
end
