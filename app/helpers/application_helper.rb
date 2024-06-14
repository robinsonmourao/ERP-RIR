module ApplicationHelper
  def listar_opcoes_modulo(modulo)
    return [] unless modulo.is_a?(Module)

    lista = []
    modulo.constants.each do |nome_constante|
      lista << "\"#{nome_constante.to_s.downcase}\""
    end
    lista.join(', ')
  end

  def pluralizeAndDowncase(classe)
    if classe
      letters = ['r', 's']
      last_letter = classe.downcase[-1]
      if letters.include?(last_letter)
        "#{classe.to_s.downcase}es"
      else
        "#{classe.to_s.downcase.pluralize}"
      end
    end
  rescue StandardError => e
    flash.now[:error] = "Ocorreu um erro interno: '#{e.message}'"
    render 'new'
  end
end
