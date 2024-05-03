class ContatosController < ApplicationController
  def index
    @contato = Contato.all
  end

  def show
    @contato = Contato.find(contato_params[:codigo_contato])
  end

  def new
    @contato = Contato.new
  end

  def create
    @contato = Contato.new(contato_params)
    Rails.logger.warn(@contato.inspect)
    if @contato.save
      flash[:notice] = "Contato successfully created"
      redirect_to @contato
    else
      flash[:notice] = "Something went wrong"
      render 'new'
    end
  end

  private

  def contato_params
    params.require(:contato).permit(:tabela, :codigo_tipo_contato, :codigo_meio_contato, :nome_pessoa, :descricao, :observacao)
  end
end
