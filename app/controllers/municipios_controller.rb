class MunicipiosController < ApplicationController
  def create
    @municipio = Municipio.new(municipio_params)

    if @municipio.save
      flash[:success] = "O MUNICIPIO, '#{@municipio.nome_municipio}' foi criado com sucesso"
    else
      flash[:notice] = "1. Tente criar um MUNICIPIO com uma nome diferente de: '#{@municipio.nome_municipio}'
        OU 2. Nenhum MUNICIPIO foi informado."
    end
    redirect_back fallback_location: ''
  end

  private

  def municipio_params
    params.permit(:codigo_uf, :nome_municipio)
  end
end
