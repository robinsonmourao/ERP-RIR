include Permissao, Categoria

class ApplicationController < ActionController::Base  

  protect_from_forgery with: :exception
  helper_method :current_usuario

  def current_usuario
    @current_usuario ||= Usuario.find_by(codigo_usuario: session[:codigo_usuario]) if session[:codigo_usuario]
  end

  def check_active_session
    return true if session[:codigo_usuario].present?
    
    flash[:notice] = 'É necessário logar para acessar o sistema RIR'
    redirect_to root_path
  end

  def login
    @usuario = Usuario.find_by(nome: params[:nome])
    Rails.logger.warn(current_usuario.inspect)
    if @usuario
      if @usuario.authenticate(params[:password])
        session[:codigo_usuario] = @usuario.codigo_usuario

        flash[:success] = "Bem-vindo, #{@usuario.nome}!"
        redirect_to dashboard_path
      end
    else
      flash[:error] =  'Usuário não encontrado!'
      redirect_to entrar_path
    end
  end

  def logout
    if session[:codigo_usuario]
      session[:codigo_usuario] = nil

      flash[:notice] = 'Você foi desconectado!'
      redirect_to root_path
    else
      flash[:error] = 'A sessão que você quis fechar já não existia previamente!'
      redirect_to root_path
    end
  end
end
