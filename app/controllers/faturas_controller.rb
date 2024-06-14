class FaturasController < CrudTemplateController
  before_action :find_fatura, only: [:show, :edit, :update, :destroy]
  before_action :new, only: [:create]

  def index
    index_template(Fatura)
  end

  def new
    @fatura = new_template(Fatura)
  end

  def create
    create_template(@fatura, 'codigo_fatura', fatura_params)
  end

  def update
    update_template(@fatura, 'codigo_fatura', fatura_params)
  end

  def destroy
    destroy_template(@fatura, 'codigo_fatura')
  end

  private

  def fatura_params
    params.require(:fatura)
          .permit(:codigo_atendimento, :codigo_meio_pagamento, :codigo_status, :codigo_grupo,
                  :chave, :valor, :vencimento, :instalacao)
  end

  def find_fatura
    @fatura = find_object(Fatura, params)
  end
end
