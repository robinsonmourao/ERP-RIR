class ContatosController < ApplicationController
  before_action :check_active_session

  def index
    @contatos = Contato.all
    unless @contatos.any?
      render 'layouts/not_found'
    end
  end

  def show
    begin
      @contato = Contato.find(params[:id])
    rescue StandardError => e
      flash[:error] = "Contato não encontrado: '#{e.message}'"
      render 'layouts/not_found'
    end
  end

  def new
    @tipo_contato = TipoContato.all
    @meio_contato = MeioContato.all

    @contato = Contato.new
  end

  def create
    @contato = Contato.new(contato_params)
    if @contato.save
      flash[:success] = "Um contato com '#{@contato.nome_pessoa}' foi criado com sucesso."
      redirect_to @contato
    else
      flash[:error] = 'Não foi possível salvar o contato.'
      render 'new'
    end
  end

  def edit
    begin
      @contato = Contato.find(params[:id])
      @tipo_contato = TipoContato.all
      @meio_contato = MeioContato.all
    rescue StandardError => e
      flash[:error] = "Contato não encontrado: '#{e.message}'"
      render 'not_found'
    end
  end

  def update
    @contato = Contato.find(params[:id])
    if @contato.update_attributes(params[:contato])
      flash[:success] = "Contato was successfully updated"
      redirect_to @contato
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    begin
      @contato = Contato.find(params[:id])
      if @contato.destroy
        flash[:success] = "O CONTATO de descrição '#{@contato.descricao}', foi apagado com sucesso."
      else
        flash[:notice] = "Não foi possível apagar o CONTATO cuja descrição '#{@contato.descricao}'!"
      end
    rescue StandardError => e
      flash[:error] = "Contato não encontrado: '#{e.message}'"
    end
    redirect_to contatos_path
  end

  private

  def contato_params
    params.require(:contato).permit(:tabela, :codigo_tipo_contato, :codigo_meio_contato, :nome_pessoa, :descricao, :observacao)
  end
end
