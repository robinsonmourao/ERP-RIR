class ContatosController < ApplicationController
  def index
    @contato = Contato.all
  end

  def show
    @contato = Contato.find(params[:codigo_contato])
  end

  def new
    @contato = Contato.new
  end

  private

  def contato_params
    params.require(:contato).permit(:tabela, :codigo_contato_tipo, :codigo_contato_meio, :nome_pessoa, :descricao, :observacao)
  end
end
