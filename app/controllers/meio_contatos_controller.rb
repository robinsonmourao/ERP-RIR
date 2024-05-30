class MeioContatosController < ApplicationController
  def create
    @meio_contato = MeioContato.new(meio_contato_params)

    if @meio_contato.save
      flash[:success] = "O MeioContato, '#{@meio_contato.descricao}' foi criado com sucesso"
    else
      flash[:notice] =
        "1. O MEIO DE CONTATO '#{@meio_contato.descricao}',
        não está entre as opções permitidas #{listar_opcoes_modulo(ModuloMeioContato)}
        OU 2. O MEIO DE CONTATO já existe
        OU 3. Nenhum MEIO DE CONTATO foi informado"
    end
    redirect_to new_contato_path
  end

  private

  def meio_contato_params
    params.require(:meio_contato).permit(:descricao)
  end
end
