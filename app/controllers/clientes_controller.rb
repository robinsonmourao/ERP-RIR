class ClientesController < ApplicationController
  before_action :buscar_cliente, only: [:show, :edit, :update, :destroy]

  def index
    @clientes = Cliente.all
    unless @clientes.any?
      render 'layouts/not_found'
    end
  end

  def new
    @cidades = Municipio.all
    # @contatos = Contato.all
    # @sites = Site.all

    @cliente = Cliente.new
  end

  def create
    @cliente = Cliente.new(cliente_params)
    if @cliente.save
      flash[:success] = 'Cliente foi criado com sucesso'
      redirect_to @cliente
    else
      flash.now[:notice] = "Já existe um CLIENTE com CNPJ: '#{@cliente.cnpj}' cadastrado no sistema."
      render 'new'
    end
  rescue StandardError => e
    flash[:error] = "Ocorreu um erro interno: '#{e.message}'"
    render 'new'
  end

  def edit
    @municipios = Municipio.all
  rescue StandardError => e
    flash[:error] = "Cliente não encontrado: '#{e.message}'"
    render 'not_found'
  end

  def update
    if @cliente.update(cliente_params)
      flash[:success] = 'Cliente foi atualizado com sucesso!'
      redirect_to @cliente
    else
      flash[:notice] = "Não foi possível ATUALIZAR o CLIENTE pois o CNPJ '#{@cliente.cnpj}' já está em uso!"
      render 'edit'
    end
  rescue StandardError => e
    flash[:error] = "Ocorreu um erro interno: '#{e.message}'"
    render 'new'
  end

  def destroy
    if @cliente.destroy
      flash[:success] = 'Cliente foi deletado com sucesso.'
    else
      flash[:notice] = 'Não foi possível deletar cliente!'
    end
    redirect_to clientes_path
  rescue StandardError => e
    flash[:error] = "Cliente não encontrado: '#{e.message}'"
    redirect_to clientes_path
  end

  private

  def cliente_params
    params.require(:cliente).permit(:nome_cliente, :endereco, :bairro, :codigo_municipio, :cep, :cnpj, :inscricao_estadual, :inscricao_municipal)
  end

  def buscar_cliente
    @cliente = Cliente.find(params[:id])
  rescue StandardError => e
    flash[:error] = "Cliente não foi encontrado '#{e.message}'"
    render 'layouts/not_found'
  end
end
