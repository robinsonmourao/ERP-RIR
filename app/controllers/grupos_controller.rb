class GruposController < CrudTemplateSecundariasController
  before_action :new, only: [:create]

  def new
    @grupo = Grupo.new
  end

  def create
    template_secundarias_create(@grupo, 'descricao', grupo_params)
  end

  private

  def grupo_params
    params.permit(:descricao)
  end

  def find_grupo
    @grupo = find_object(Grupo, params)
  end
end
