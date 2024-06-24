class CrudTemplateSecundariasController < ApplicationController
  def create_template_secundarias(object, nome_parametro_unico, object_params)
    classe = object.class
    valor_parametro_unico = object[nome_parametro_unico]
    new_object = classe.new(object_params)

    if new_object.save
      flash[:success] = "#{classe} com #{nome_parametro_unico} '#{valor_parametro_unico}' 
                        foi criado com sucesso."
    else
      flash[:notice] = "Não foi possível salvar #{classe}. 
                           O #{nome_parametro_unico}: '#{valor_parametro_unico}' já está em uso OU é inválido!"
    end
  rescue ActiveRecord::RecordInvalid => e
    flash[:error] = "Ocorreu um erro interno: '#{e.message}'"
  rescue StandardError => e
    flash[:error] = "Ocorreu um erro interno: '#{e.message}'"
  ensure
    redirect_to previous_path
  end

  private

  def object_params
    params.permit(:descricao)
  end

  def find_object(object_class, params)
    @object = object_class.find(params[:id])
  rescue StandardError => e
    flash[:error] = "#{@object.class} não foi encontrado '#{e.message}'"
    render 'layouts/not_found'
  end
end
