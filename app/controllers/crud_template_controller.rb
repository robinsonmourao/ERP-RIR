class CrudTemplateController < ApplicationController
  before_action :check_active_session
  # before_action :find_object, only: [:show, :edit, :update, :destroy]

  def index_template(object)
    object = (object.class).all
    unless object.any?
      render 'layouts/not_found'
    end
  end

  def new_template(object_class)
    # @tipo_contatos = TipoContato.all
    # @meio_contatos = MeioContato.all

    @object = object_class.new
  end

  def show_template(object, params)
    @object = (object.class).find(params[:id])
  end

  def create_template(object, unique_param_type, object_params)
    classe = object.class
    unique_param_type_downcased = unique_param_type.downcase
    new_object = classe.new(object_params)
    if new_object.save

      flash[:success] = "Um '#{new_object.class}' com #{unique_param_type} '#{object.send(unique_param_type_downcased)}'
                        foi criado com sucesso."

      if classe == Usuario
        autenticar(new_object)
      else
        redirect_to new_object
      end
    else
      flash[:notice] = "Não foi possível salvar o #{new_object.class}. 
                       O #{unique_param_type} informado '#{object.send(unique_param_type_downcased)}' já está em uso!"
      if classe == Usuario
        redirect_to "/#{classe.to_s.downcase.pluralize}/new"
      else
        render 'new'
      end
    end
  rescue StandardError => e
    flash[:error] = "Ocorreu um erro interno: '#{e.message}'"
    render 'new'
  end

  def update_template(object)
    if object.update(object_params)
      flash[:success] = "O '#{object.class}' de descrição '#{object.descricao}', foi ATUALIZADO com sucesso."
      redirect_to object
    else
      flash[:notice] = "Não foi possível ATUALIZAR o '#{object.class}' cuja descrição '#{object.descricao}'!"
      render 'edit'
    end
  rescue StandardError => e
    flash[:error] = "Ocorreu um erro interno: '#{e.message}'"
    render 'new'
  end

  def destroy_template(object)
    if object.destroy
      flash[:success] = "O #{object.class} de descrição '#{object.descricao}', foi apagado com sucesso."
      redirect_to 'index'
    else
      flash[:notice] = "Não foi possível apagar o #{object.class} cuja descrição '#{object.descricao}'!"
    end
  rescue StandardError => e
    flash[:error] = "Object não encontrado: '#{e.message}'"
    render 'index'
  end

  private

  def find_object(object_class, params)
    @object = object_class.find(params[:id])
  rescue StandardError => e
    flash[:error] = "#{@object.class} não foi encontrado '#{e.message}'"
    render 'layouts/not_found'
  end
end
