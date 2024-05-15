class ClientesController < ApplicationController
  def index
    @clientes = Cliente.all
  end

  def show
    @cliente = Cliente.find(params[:codigo_cliente])
  end

  def new
    @cliente = Cliente.new
  end

  def create
    @cliente = Cliente.new(cliente_params)
    if @cliente.save
      flash[:success] = 'Cliente foi criado com sucesso'
      redirect_to @cliente
    else
      flash[:error] = 'Não foi possível criar um cliente'
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
    params.require(:cliente).permit(:nome, :endereco, :bairro, :cidade, :cep, :inscricao_estadual, :inscricao_municipal, :cnpj)
  end
end
