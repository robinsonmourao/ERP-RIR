class BoletosController < CrudTemplateController
  before_action :find_boleto, only: [:show, :edit, :update, :destroy]
  before_action :new, only: [:create]
  before_action :load_tabelas_secundarias, only: [:new, :edit]

  def index
    index_template(Boleto)
  end

  def new
    @boleto = new_template(Boleto)
  end

  def show
    show_template(@boleto)
  end

  def create
    create_template(@boleto, boleto_params)
  end

  def update
    update_template(@boleto, boleto_params)
  end

  def destroy
    destroy_template(@boleto)
  end

  private

  def boleto_params
    params.require(:boleto)
          .permit(:codigo_atendimento_composto, :codigo_fatura, :codigo_grupo, :codigo_local_pagamento, :codigo_status,
                  :vencimento, :chave, :data_pagamento, :valor_pagamento, :observacao)
  end

  def find_boleto
    @boleto = find_object(Boleto, params)
  end

  def load_tabelas_secundarias
    @tabelas_secundarias = load_tabelas_secundarias_template(Boleto)
  end
end
