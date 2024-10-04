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
    params.require(:status).permit(:descricao_acfs, :codigo_situacao)
  end

  def find_status
    @status = find_object(Status, params)
  end

  def build_acfs_list
    @acfs = []

    @acfs += Atendimento.all.map { |atendimento| [atendimento.tabela_dto, "#{atendimento.id}", 'a'] }
    @acfs += Cliente.all.map { |cliente| [cliente.tabela_dto, "#{cliente.id}", 'c'] }
    @acfs += Fornecedor.all.map { |fornecedor| [fornecedor.tabela_dto, "#{fornecedor.id}", 'f'] }
    @acfs += Site.all.map { |site| [site.tabela_dto, "#{site.id}", 's'] }
  end
end
