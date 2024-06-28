class StatusesController < CrudTemplateController
  before_action :find_status, only: [:show, :edit, :update, :destroy]
  before_action :new, only: [:create]
  before_action :build_acfs_list, only: [:new, :edit, :create, :update]

  def index
    index_template(Status)
  end

  def new
    @status = Status.new
  end

  def show
    show_template(@status)
  end

  def edit
  end

  def create
    create_template(@status, status_params)
  end

  def update
    update_template(@status, status_params)
  end

  def destroy
    destroy_template(@status)
  end

  private

  def status_params
    params.require(:status).permit(:codigo_acfs, :tabela, :codigo_situacao)
  end

  def find_status
    @status = find_object(Status, params)
  end

  def build_acfs_list
    @acfs = []

    @acfs += Site.all.map { |site| [site.nome_site, "#{site.id}"] }
    @acfs += Fornecedor.all.map { |fornecedor| [fornecedor.nome_fornecedor, "#{fornecedor.id}"] }
    @acfs += Cliente.all.map { |cliente| [cliente.nome_cliente, "#{cliente.id}"] }
    @acfs += Atendimento.all.map { |atendimento| [atendimento.codigo_atendimento_composto, "#{atendimento.id}"] }
  end
end
