class CrudTemplateController < ApplicationController
  before_action :check_active_session
  before_action :store_previous_path, only: [:new, :edit]

  def index_template(object_class)
    load_nome_parametro_unico(object_class)
    @objects = object_class.all
    unless @objects.any?
      render 'layouts/not_found'
    end
  end

  def new_template(object_class)
    @object = object_class.new
  end

  def show_template(object)
    load_nome_parametro_unico(object.class)
    @object = (object.class).find(params[:id])
  end

  def create_template(object, object_params)
    classe = object.class
    new_object = classe.new(object_params)
    load_nome_parametro_unico(classe)
    load_valor_parametro_unico(classe, new_object, object_params)

    if new_object.save
      flash[:success] = "#{classe} com #{@nome_parametro_unico.humanize.downcase} '#{@valor_parametro_unico}' 
                        foi criado com sucesso."
      classe == Usuario ? autenticar(new_object) : redirect_to(new_object)
    else
      flash[:notice] = "Não foi possível salvar #{classe}.
                        O #{@nome_parametro_unico.humanize.downcase}: '#{@valor_parametro_unico}' já está em uso OU é inválido!"
      classe == Usuario ? redirect_to(new_usuario_path) : render('new')
    end
  rescue ActiveRecord::RecordInvalid => e
    flash[:error] = "Ocorreu um erro interno: '#{e.message}'"
    render('new')
  rescue StandardError => e
    flash[:error] = "Ocorreu um erro interno: '#{e.message}'"
    render('new')
  end

  def update_template(object, object_params)
    classe = object.class
    load_nome_parametro_unico(classe)
    valor_parametro_unico = object[@nome_parametro_unico]

    if object.update(object_params)
      flash[:success] = "#{classe} de #{@nome_parametro_unico.humanize.downcase} '#{valor_parametro_unico}' 
                        foi ATUALIZADO com sucesso."
      redirect_to object
    else
      flash[:notice] = "Não foi possível ATUALIZAR '#{classe}' de 
                        #{@nome_parametro_unico.humanize.downcase} '#{valor_parametro_unico}' 
                        já está em uso OU é inválido!"
      render 'edit'
    end
  rescue ActiveRecord::RecordInvalid => e
    flash[:error] = "Ocorreu um erro interno: '#{e.message}'"
    render 'edit'
  rescue StandardError => e
    flash[:error] = "Ocorreu um erro interno: '#{e.message}'"
    render 'edit'
  end

  def destroy_template(object)
    classe = object.class
    load_nome_parametro_unico(classe)
    valor_parametro_unico = object.send(@nome_parametro_unico.downcase)

    if object.destroy
      flash[:success] = "#{classe} de #{@nome_parametro_unico.humanize.downcase} '#{valor_parametro_unico}' 
                        foi apagado com sucesso."
      classe == Usuario ? logout : redirect_to("/#{classe.to_s.downcase.pluralize}/")
    else
      flash[:notice] = "Não foi possível apagar #{classe}. De 
                       #{@nome_parametro_unico.humanize.downcase} '#{valor_parametro_unico}'!"
    end
  rescue ActiveRecord::RecordInvalid => e
    flash[:error] = "Ocorreu um erro interno: '#{e.message}'"
    redirect_to "/#{classe.to_s.downcase.pluralize}/"
  rescue StandardError => e
    flash[:error] = "Ocorreu um erro interno: '#{e.message}'"
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
      Cliente => ['municipios'],
      Boleto => ['grupos', 'local_pagamentos'],
      Fatura => ['grupos', 'meio_pagamentos'],
      Fornecedor => ['municipios'],
      Site => ['tipo_links', 'municipios']
    }
    templates[classe] || []
  end

  def load_nome_parametro_unico(classe)
    templates = {
      Atendimento => 'codigo_atendimento_composto',
      Boleto => 'codigo_boleto_composto',
      Cliente => 'cnpj',
      Contato => 'descricao',
      Fatura => 'codigo_fatura',
      Fornecedor => 'nome_fornecedor',
      Site => 'nome_site',
      Status => 'codigo_acfs_composto',
      Usuario => 'nome'
    }
    @nome_parametro_unico = templates[classe] || []
  end

  def load_valor_parametro_unico(classe, object, object_params)    
    templates = {
      Atendimento => montar_campo_composto(object),
      Boleto => montar_campo_composto(object),
      Status => montar_campo_composto(object),
      Cliente => object_params[@nome_parametro_unico],
      Contato => object_params[@nome_parametro_unico],
      Fatura => object_params[@nome_parametro_unico],
      Fornecedor => object_params[@nome_parametro_unico],
      Site => object_params[@nome_parametro_unico],
      Usuario => object_params[@nome_parametro_unico]
    }
    @valor_parametro_unico = templates[classe] || nil
  end

  def montar_campo_composto(object)
    case object
    when Atendimento
      "001#{object&.designacao} 002#{object&.nome_fornecedor}"
    when Boleto
      "001#{object&.codigo_atendimento} 002#{object&.vencimento} 003#{object.codigo_grupo}"
    when Status
      "001#{object&.tabela} 002#{object&.codigo_acfs}"
    end
  end
end
