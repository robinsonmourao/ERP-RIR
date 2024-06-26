class TipoContatosController < CrudTemplateSecundariasController
  before_action :new, only: [:create]

  def new
    @tipo_contato = new_template_secundarias(TipoContato)
  end

  def create
    create_template_secundarias(@tipo_contato, 'descricao', tipo_contato_params)
  end

  private

  def tipo_contato_params
    params.permit(:descricao)
  end
end
