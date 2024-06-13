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
    letters = ['r', 's']
    last_letter = classe.downcase[-1]
    if letters.include?(last_letter)
      pluralized_classe = "#{classe.to_s.downcase}es".downcase
    else
      pluralized_classe = "#{classe.to_s.downcase.pluralize}".downcase
    end
  end
end
