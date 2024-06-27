class AtendimentosController < CrudTemplateController
  before_action :find_atendimento, only: [:show, :edit, :update, :destroy]
  before_action :new, only: [:create]
  before_action :load_tabelas_secundarias, only: [:new, :edit, :create]

  def index
    index_template(Atendimento)
  end

  def new
    @atendimento = Atendimento.new
  end

  def show
    show_template(@atendimento)
  end

  def create
    create_template(@atendimento, atendimento_params)
  end

  def update
    update_template(@atendimento, atendimento_params)
  end

  def destroy
    destroy_template(@atendimento)
  end

  private

  def atendimento_params
    params.require(:atendimento)
          .permit(:designacao, :codigo_fornecedor, :codigo_tecnologia_link, :codigo_tipo_link, :velocidade_down,
                  :velocidade_up, :ip, :ip_fixo, :pppoe_login, :pppoe_senha, :link, :dia_vencimento, :valor_mensal,
                  :valor_instalacao, :codigo_meio_pagamento, :chave_pix, :nota_fiscal, :codigo_equipamento)
  end

  def find_atendimento
    @atendimento = Atendimento.find(params[:id])
  rescue StandardError => e
    flash[:error] = "Atendimento não foi encontrado '#{e.message}'"
    render 'layouts/not_found'
  end

  def load_tabelas_secundarias
    @tabelas_secundarias = load_tabelas_secundarias_template(Atendimento)
  end
end
