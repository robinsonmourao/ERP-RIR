module ApplicationHelper
  def current_usuario
    @current_usuario ||= Usuario.find_by(codigo_usuario: session[:codigo_usuario]) if session[:codigo_usuario]
  end

  def check_active_session
    return true if session[:codigo_usuario].present?

    flash[:notice] = 'É necessário logar para acessar o sistema RIR'
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

  def store_previous_path
    session[:previous_path] = request.fullpath
  end

  def previous_path
    default = "/"
    session[:previous_path] ||= default
  end
end
