class FaturasController < CrudTemplateController
  before_action :find_fatura, only: [:show, :edit, :update, :destroy]
  before_action :new, only: [:create]
  before_action :load_tabelas_secundarias, only: [:new, :edit]

  def index
    index_template(Fatura)
  end

  def new
    @fatura = new_template(Fatura)
  end

  def show
    show_template(@fatura)
  end

  def create
    create_template(@fatura, fatura_params)
  end

  def update
    update_template(@fatura, fatura_params)
  end

  def destroy
    destroy_template(@fatura)
  end

  private

  def fatura_params
    params.require(:fatura)
          .permit(:codigo_atendimento_composto, :codigo_meio_pagamento, :codigo_status, :descricao_grupo,
                  :chave, :valor, :vencimento, :instalacao)
  end

  def find_fatura
    @fatura = find_object(Fatura, params)
  end

  def load_tabelas_secundarias
    @tabelas_secundarias = load_tabelas_secundarias_template(Fatura)
  end
end
