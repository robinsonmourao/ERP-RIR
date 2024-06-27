class UfsController < CrudTemplateSecundariasController
  before_action :new, only: [:create]

  def new
    @uf = Uf.new(uf_params)
  end

  def create
    create_template_secundarias(@uf, 'nome_uf', uf_params)
  end

  private

  def uf_params
    params.permit(:sigla, :nome_estado)
  end
end
