class StatusesController < CrudTemplateController
  before_action :find_status, only: [:show, :edit, :update, :destroy]
  before_action :new, only: [:create]

  def index
    index_template(Status)
  end

  def new
    @acfs = []

    @acfs += Site.all.map { |site| [site.nome_site, "#{site.id}"] }
    @acfs += Fornecedor.all.map { |fornecedor| [fornecedor.nome_fornecedor, "#{fornecedor.id}"] }
    @acfs += Cliente.all.map { |cliente| [cliente.nome_cliente, "#{cliente.id}"] }
    @acfs += Atendimento.all.map { |atendimento| [atendimento.codigo_atendimento_composto, "#{atendimento.id}"] }

    @status = Status.new
  end

  def create
    create_template(@status, "codigo_acfs_composto", status_params)
  end

  def update
    update_template(@status, "codigo_acfs_composto", status_params)
  end

  def destroy
    destroy_template(@status, "codigo_acfs_composto")
  end

  private

  def status_params
    params.require(:status).permit(:codigo_acfs, :tabela, :codigo_situacao)
  end

  def find_status
    @status = find_object(Status, params)
  end
end
