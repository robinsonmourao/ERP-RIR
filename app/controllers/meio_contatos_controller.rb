class MeioContatosController < ApplicationController
  def create
    @meio_contato = MeioContato.new(meio_contato_params)

    if @meio_contato.save
      flash[:success] = "O MeioContato, '#{@meio_contato.descricao}' foi criado com sucesso"
    else
      flash[:error] = "O meio de contato '#{@meio_contato.descricao}', não está entre as opções permitidas #{listar_opcoes_modulo(ModuloMeioContato)}"
    end
    redirect_to new_contato_path
  end

  private

  def meio_contato_params
    params.require(:meio_contato).permit(:descricao)
  end
end
