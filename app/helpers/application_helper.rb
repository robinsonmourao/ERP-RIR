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

  def format_value_to_currency_real(value)
    return unless value.present?

    cleaned_value = value.to_s.gsub("R$", "").gsub(".", "").gsub(",", ".").strip
    valid_number = Float(cleaned_value)

    return unless valid_number

    formatted_value = format('%.2f', cleaned_value.to_f).tr('.', ',')
    parts = formatted_value.split(',')
    integer_part = parts[0]
    decimal_part = parts[1]

    integer_part_with_commas = integer_part.reverse.scan(/\d{1,3}/).join('.').reverse
    "R$ #{integer_part_with_commas},#{decimal_part}"
  end
end
