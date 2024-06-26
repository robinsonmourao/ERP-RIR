class CrudTemplateController < ApplicationController
  before_action :check_active_session
  before_action :store_previous_path, only: [:new, :edit]

  def index_template(object_class)
    @objects = object_class.all
    unless @objects.any?
      render 'layouts/not_found'
    end
  end

  def new_template(object_class)
    @object = object_class.new
  end

  def show_template(object, params)
    @object = (object.class).find(params[:id])
  end

  def create_template(object, nome_parametro_unico, object_params)
    classe = object.class
    valor_parametro_unico = object[nome_parametro_unico]
    new_object = classe.new(object_params)

    if new_object.save

      flash[:success] = "#{classe} com #{nome_parametro_unico} '#{valor_parametro_unico}' 
                        foi criado com sucesso."
      if classe == Usuario
        autenticar(new_object)
      else
        redirect_to new_object
      end
    else
      flash.now[:notice] = "Não foi possível salvar #{classe}. 
                           O #{nome_parametro_unico}: '#{valor_parametro_unico}' já está em uso OU é inválido!"
      if classe == Usuario
        redirect_to dashboard_path
      else
        render 'new'
      end
    end
  rescue ActiveRecord::RecordInvalid => e
    flash.now[:error] = "Ocorreu um erro interno: '#{e.message}'"
    render 'new'
  rescue StandardError => e
    flash.now[:error] = "Ocorreu um erro interno: '#{e.message}'"
    render 'new'
  end

  def update_template(object, nome_parametro_unico, object_params)
    classe = object.class
    valor_parametro_unico = object.send(nome_parametro_unico.downcase)

    if object.update(object_params)
      flash[:success] = "#{classe} de #{nome_parametro_unico} '#{valor_parametro_unico}' foi ATUALIZADO com sucesso."
      redirect_to object
    else
      flash[:notice] = "Não foi possível ATUALIZAR '#{classe}' de #{nome_parametro_unico} '#{valor_parametro_unico}'
                       já está em uso OU é inválido!"
      render 'edit'
    end
  rescue ActiveRecord::RecordInvalid => e
    flash.now[:error] = "Ocorreu um erro interno: '#{e.message}'"
    render 'edit'
  rescue StandardError => e
    flash.now[:error] = "Ocorreu um erro interno: '#{e.message}'"
    render 'edit'
  end

  def destroy_template(object, nome_parametro_unico)
    classe = object.class
    valor_parametro_unico = object.send(nome_parametro_unico.downcase)

    if object.destroy
      flash[:success] = "#{classe} de #{nome_parametro_unico} '#{valor_parametro_unico}' foi apagado com sucesso."
    else
      flash[:notice] = "Não foi possível apagar #{classe}. De #{nome_parametro_unico} '#{valor_parametro_unico}'!"
    end
  rescue ActiveRecord::RecordInvalid => e
    flash.now[:error] = "Ocorreu um erro interno: '#{e.message}'"
  rescue StandardError => e
    flash.now[:error] = "Ocorreu um erro interno: '#{e.message}'"
  ensure
    redirect_to "/#{classe.to_s.downcase.pluralize}/"
  end

  private

  def find_object(object_class, params)
    @object = object_class.find(params[:id])
  rescue StandardError => e
    flash[:error] = "#{@object.class} não foi encontrado '#{e.message}'"
    render 'layouts/not_found'
  end

  def load_tabelas_secundarias_template(classe)
    templates = {
      Atendimento => ['tipo_links', 'tecnologia_links', 'meio_pagamentos', 'equipamentos'],
      Contato => ['meio_contatos', 'tipo_contatos'],
      Cliente => ['ufs', 'municipios'],
      Boleto => ['grupos', 'local_pagamentos'],
      Fatura => ['grupos', 'meio_pagamentos'],
      Fornecedor => ['ufs', 'municipios'],
      Site => ['tipo_links', 'municipios']
    }
    templates[classe] || []
  end
end
