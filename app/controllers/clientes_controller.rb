class ClientesController < CrudTemplateController
  before_action :buscar_cliente, only: [:show, :edit, :update, :destroy]
  before_action :new, only: [:create]
  before_action :load_tabelas_secundarias, only: [:new, :edit, :create]

  def index
    index_template(Cliente)
  end

  def new
    @cliente = new_template(Cliente)
  end

  def show
    show_template(@cliente)
  end

  def create
    create_template(@cliente, cliente_params)
  end

  def update
    update_template(@cliente, cliente_params)
  end

  def destroy
    destroy_template(@cliente)
  end

  private

  def cliente_params
    params.require(:cliente).permit(:nome_cliente, :endereco, :bairro, :codigo_municipio, :cep, :cnpj,
                                    :inscricao_estadual, :inscricao_municipal)
  end

  def buscar_cliente
    @cliente = Cliente.find(params[:id])
  rescue StandardError => e
    flash[:error] = "Cliente não foi encontrado '#{e.message}'"
    render 'layouts/not_found'
  end

  def load_tabelas_secundarias
    @tabelas_secundarias = load_tabelas_secundarias_template(Cliente)
  end
end
