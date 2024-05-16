class UsuariosController < ApplicationController
  before_action :check_active_session, only: [:show]

  def new
    @usuario = Usuario.new
  end

  def show
    @usuario = current_usuario
  end

  def create
    @usuario = Usuario.new(usuario_params)
    begin
      if @usuario.save

        @usuario.authenticate(params[:password])
        session[:codigo_usuario] = @usuario.codigo_usuario

        flash[:success] = "Bem-vindo, #{@usuario.nome}!"
        redirect_to dashboard_path
      else
        flash[:notice] = 'Nome de usuário já está em uso ou com campos vazios'
        redirect_to new_usuario_path
      end
    rescue StandardError => e
      flash[:error] = "Erro ao armazenar usuário: #{e.message}"
      redirect_to new_usuario_path
    end
  end

  private

  def usuario_params
    params.require(:usuario).permit(:password, :nome, :permissao)
  end
end
