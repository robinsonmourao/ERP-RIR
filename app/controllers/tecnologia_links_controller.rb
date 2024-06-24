class TecnologiaLinksController < CrudTemplateSecundariasController
  before_action :new, only: [:create]

  def new
    @tecnologia_link = TecnologiaLink.new
  end

  def create
    create_template_secundarias(@tecnologia_link, 'descricao', tecnologia_link_params)
  end

  private

  def tecnologia_link_params
    params.permit(:descricao)
  end
end
