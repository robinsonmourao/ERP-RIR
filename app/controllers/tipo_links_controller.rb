class TipoLinksController < CrudTemplateSecundariasController
  before_action :new, only: [:create]

  def new
    @tipo_link = TipoLink.new
  end

  def create
    create_template_secundarias(@tipo_link, 'descricao', tipo_link_params)
  end

  private

  def tipo_link_params
    params.permit(:descricao)
  end
end
