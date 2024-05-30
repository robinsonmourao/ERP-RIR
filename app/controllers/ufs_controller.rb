class UfsController < ApplicationController
  def create
    @uf = Uf.new(uf_params)

    if @uf.save
      flash[:success] = "A UF, '#{@uf.sigla}' foi criado com sucesso"
    else
      flash[:notice] = "1. Tente criar um UF com a sigla diferente de: '#{@uf.sigla}'
        OU 2. Nenhum UF foi informado."
    end
    redirect_to new_site_path
  end

  private

  def uf_params
    params.permit(:sigla, :nome_estado)
  end
end
