include Permissao, Categoria, ModuloMeioContato, ModuloExistenciaNotaFiscal, ModuleIP, ModuleLink, ModuleSituacao, ModuleInstalacao

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, only: [:login, :logout]
  helper_method :current_usuario
  # before_action :check_active_session, except: [:login, :autenticar, :cadastrar]

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
    if @usuario
      autenticar(@usuario)
    else
      flash[:notice] = "Usuário '#{params[:nome]}' não encontrado!"
      redirect_to entrar_path
    end
  end

  def autenticar(usuario)
    if usuario.authenticate(params[:password])
      session[:codigo_usuario] = usuario.codigo_usuario

      flash[:success] = "Bem-vindo, #{usuario.nome}!"
      redirect_to dashboard_path
    end
  end

  def logout
    if session[:codigo_usuario]
      session[:codigo_usuario] = nil

      flash[:notice] = 'Você foi desconectado!'
    else
      flash[:error] = 'A sessão que você quis fechar já não existia previamente!'
    end
    redirect_to root_path
  end
end
