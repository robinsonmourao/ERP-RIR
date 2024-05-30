class ContatosController < ApplicationController
  before_action :check_active_session
  before_action :buscar_contato, only: [:show, :edit, :update, :destroy]

  def index
    @contatos = Contato.all
    unless @contatos.any?
      render 'layouts/not_found'
    end
  end

  def new
    @tipo_contatos = TipoContato.all
    @meio_contatos = MeioContato.all

    @contato = Contato.new
  end

  def create
    @contato = Contato.new(contato_params)
    if @contato.save
      flash[:success] = "Um contato com '#{@contato.nome_pessoa}' foi criado com sucesso."
      redirect_to @contato
    else
      flash[:notice] = 'Não foi possível salvar o contato.'
      render 'new'
    end
  rescue StandardError => e
    flash[:error] = "Ocorreu um erro interno: '#{e.message}'"
    render 'new'
  end

  def update
    if @contato.update(contato_params)
      flash[:success] = "O CONTATO de descrição '#{@contato.descricao}', foi ATUALIZADO com sucesso."
      redirect_to @contato
    else
      flash[:notice] = "Não foi possível ATUALIZAR o CONTATO cuja descrição '#{@contato.descricao}'!"
      render 'edit'
    end
  rescue StandardError => e
    flash[:error] = "Ocorreu um erro interno: '#{e.message}'"
    render 'new'
  end

  def destroy
    if @contato.destroy
      flash[:success] = "O CONTATO de descrição '#{@contato.descricao}', foi apagado com sucesso."
      redirect_to contatos_path
    else
      flash[:notice] = "Não foi possível apagar o CONTATO cuja descrição '#{@contato.descricao}'!"
    end
  rescue StandardError => e
    flash[:error] = "Contato não encontrado: '#{e.message}'"  
    redirect_to contatos_path
  end

  private

  def contato_params
    params.require(:contato).permit(:tabela, :codigo_tipo_contato, :codigo_meio_contato, :nome_pessoa, :descricao, :observacao)
  end

  def buscar_contato
    @contato = Contato.find(params[:id])
  rescue StandardError => e
    flash[:error] = "Contato não foi encontrado '#{e.message}'"
    render 'layouts/not_found'
  end
end
