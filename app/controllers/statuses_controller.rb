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
    create_template(@status, "codigo_acfs", status_params)
  end

  def update
    update_template(@status, "codigo_acfs", status_params)
  end

  def destroy
    destroy_template(@status, "codigo_acfs")
  end

  private

  def status_params
    params.require(:status).permit(:codigo_acfs, :tabela, :codigo_situacao)
  end

  def find_status
    @status = Status.find(params[:id])
  rescue StandardError => e
    flash[:error] = "Status não foi encontrado '#{e.message}'"
    render 'layouts/not_found'

    # @status = find_object(Status, status_params)
  end
end
