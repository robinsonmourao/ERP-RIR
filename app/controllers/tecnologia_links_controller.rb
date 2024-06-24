class TecnologiaLinksController < CrudTemplateSecundariasController
  def create
    create_template_secundarias(@tecnologia_link, 'descricao', tecnologia_link_params)
  end

  private

  def tecnologia_link_params
    params.require(:descricao)
  end
end
