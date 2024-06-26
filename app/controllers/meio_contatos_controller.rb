class MeioContatosController < CrudTemplateSecundariasController
  before_action :new, only: [:create]

  def new
    @meio_contato = new_template_secundarias(MeioContato)
  end

  def create
    create_template_secundarias(@meio_contato, 'descricao', meio_contato_params)
  end

  private

  def meio_contato_params
    params.permit(:descricao)
  end
end
