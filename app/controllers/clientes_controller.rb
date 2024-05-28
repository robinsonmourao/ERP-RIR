class ClientesController < ApplicationController
  def index
    @clientes = Cliente.all
    unless @clientes.any?
      render 'layouts/not_found'
    end
  end

  def show
    begin
      @cliente = Cliente.find(params[:id])
    rescue StandardError => e
      flash[:error] = "cliente não encontrado: '#{e.message}'"
      render 'layouts/not_found'
    end
  end

  def new
    @cidades = Municipio.all
    @contatos = Contato.all
    @sites = Site.all

    @cliente = Cliente.new
  end

  def create
    begin
      @cliente = Cliente.new(cliente_params)
      if @cliente.save
        flash[:success] = 'Cliente foi criado com sucesso'
        redirect_to @cliente
      else
        flash.now[:notice] = 'Não foi possível criar o cliente. Verifique os erros e tente novamente.'
        render 'new'
      end
    rescue StandardError => e
      flash[:error] = "Ocorreu um erro inesperado: '#{e.message}'"
      render 'new'
    end
  end

  def update
    @cliente = Cliente.find(params[:id])
    if @cliente.update_attributes(params[:cliente])
      flash[:success] = 'Cliente foi atualizado com sucesso!'
      redirect_to @cliente
    else
      flash[:error] = 'Não foi possível atualizar cliente!'
      render 'edit'
    end
  end

  def destroy
    @cliente = Cliente.find(params[:id])
    if @cliente.destroy
      flash[:success] = 'Cliente foi deletado com sucesso.'
    else
      flash[:error] = 'Não foi possível deletar cliente!'
    end
    redirect_to clientes_path
  end

  def cliente_params
    params.require(:cliente).permit(:nome_cliente, :endereco, :bairro, :codigo_municipio, :cep, :cnpj, :inscricao_estadual, :inscricao_municipal)
  end
end
