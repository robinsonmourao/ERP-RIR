include Permissao, Categoria, ModuloMeioContato, ModuloTipoLink

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, only: [:login, :logout]
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
    if @usuario
      if @usuario.authenticate(params[:password])
        session[:codigo_usuario] = @usuario.codigo_usuario

        flash[:success] = "Bem-vindo, #{@usuario.nome}!"
        redirect_to dashboard_path
      end
    else
      flash[:error] = 'Usuário não encontrado!'
      redirect_to entrar_path
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

  def listar_opcoes_modulo(modulo)
    return [] unless modulo.is_a?(Module)

    lista = []
    modulo.constants.each do |nome_constante|
      lista << "\"#{nome_constante.to_s.downcase}\""
    end
    lista.join(', ')
  end
end
