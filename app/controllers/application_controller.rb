include Permissao

class ApplicationController < ActionController::Base  

  protect_from_forgery with: :exception
  helper_method :current_usuario

  def current_usuario
    @current_usuario ||= Usuario.find_by(codigo_usuario: session[:codigo_usuario]) if session[:codigo_usuario]
  end

  def check_active_session
    return true if session[:codigo_usuario].present?

    redirect_to root_path, notice: 'É necessário logar para acessar o sistema RIX'
  end

  def login
    @usuario = Usuario.find_by(nome: params[:nome])
    Rails.logger.warn(current_usuario.inspect)
    if @usuario
      if @usuario.authenticate(params[:password])
        session[:codigo_usuario] = @usuario.codigo_usuario
        redirect_to dashboard_path, notice: "Bem-vindo, #{@usuario.nome}!"
      end
    else
      redirect_to entrar_path, notice: 'Usuário não encontrado!'
    end
  end

  def logout
    if session[:codigo_usuario]
      session[:codigo_usuario] = nil

      redirect_to root_path, notice: 'Você foi desconectado!'
    else
      redirect_to root_path, notice: 'A sessão que você quis fechar já não existia previamente!'
    end
  end
end
