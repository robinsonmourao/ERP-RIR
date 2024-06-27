class EquipamentosController < CrudTemplateSecundariasController
  before_action :new, only: [:create]

  def new
    @equipamento = Equipamento.new(equipamento_params)
  end

  def create
    create_template_secundarias(@equipamento, 'descricao', equipamento_params)
  end

  private

  def equipamento_params
    params.permit(:descricao, :mac_equipamento, :serial_equipamento)
  end
end
