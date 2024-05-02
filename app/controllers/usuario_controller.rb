class UsuarioController < ApplicationController
  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(usuario_params)

    # if check_taken_credentials(@user) || check_unacceptable_password_length(@user)
    #   return
    # end

    begin
      if @usuario.save

        @usuario.authenticate(params[:password])
        session[:codigo_usuario] = @usuario.codigo_usuario

        redirect_to dashboard_path, notice: "Bem-vindo, #{@usuario.nome}!"
      else
        redirect_to root_path, notice: 'Nome de usuário já está em uso, tente novamente informando outro'
      end
    rescue StandardError => e
      redirect_to root_path, notice: "Erro ao armazenar usuário: #{e.message}"
    end
  end

  private

  def usuario_params
    params.require(:usuario).permit(:password, :nome, :permissao)
  end
end
