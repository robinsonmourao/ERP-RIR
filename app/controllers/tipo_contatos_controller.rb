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

  def create
    @tipo_contato = TipoContato.new(tipo_contato_params)

    if @tipo_contato.save
      flash[:success] = "O TipoContato, '#{@tipo_contato.descricao}' foi criado com sucesso"
      redirect_to new_contato_path
    else
      flash[:error] = "Não foi possível criar o tipo de contato descrito: #{@tipo_contato.descricao}"
    end
  end

  private

  def tipo_contato_params
    params.require(:tipo_contato).permit(:descricao)
  end
end
