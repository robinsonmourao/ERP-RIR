class ContatosController < ApplicationController
  def index
    @contato = Contato.all
  end

  def show
    @contato = Contato.find(params[:id])
  end

  def new
    @tipo_contato = TipoContato.all
    @meio_contato = MeioContato.all
    @contato = Contato.new
  end

  def create
    @contato = Contato.new(contato_params)
    Rails.logger.warn(@contato.inspect)
    if @contato.save
      flash[:success] = 'O contato foi criado com sucesso.'
      redirect_to @contato
    else
      flash[:error] = 'Não foi possível salvar o contato.'
      render 'new'
    end
  end

  private

  def contato_params
    params.require(:contato).permit(:tabela, :codigo_tipo_contato, :codigo_meio_contato, :nome_pessoa, :descricao, :observacao)
  end
end
