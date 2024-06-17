class BoletosController < CrudTemplateController
  before_action :find_boleto, only: [:show, :edit, :update, :destroy]
  before_action :new, only: [:create]

  def index
    index_template(Boleto)
  end

  def new
    @boleto = new_template(Boleto)
  end

  def create
    create_template(@boleto, 'codigo_boleto_composto', boleto_params)
  end

  def update
    update_template(@boleto, 'codigo_boleto_composto', boleto_params)
  end

  def destroy
    destroy_template(@boleto, 'codigo_boleto_composto')
  end

  private

  def boleto_params
    params.require(:boleto)
          .permit(:codigo_atendimento, :codigo_fatura, 
                  # :codigo_grupo, :codigo_local_pagamento, 
                  :codigo_status,
                  :vencimento, :chave, :data_pagamento, :valor_pagamento, :observacao)
  end

  def find_boleto
    @boleto = find_object(Boleto, params)
  end
end
