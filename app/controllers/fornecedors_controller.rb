class FornecedorsController < CrudTemplateController
  before_action :find_fornecedor, only: [:show, :edit, :update, :destroy]
  before_action :new, only: [:create]
  before_action :load_tabelas_secundarias, only: [:new, :edit, :create]

  def index
    index_template(Fornecedor)
  end

  def show
    show_template(@fornecedor)
  end

  def new
    @fornecedor = Fornecedor.new
  end

  def create
    create_template(@fornecedor, fornecedor_params)
  end

  def update
    update_template(@fornecedor, fornecedor_params)
  end

  def destroy
    destroy_template(@fornecedor)
  end

  private

  def fornecedor_params
    params.require(:fornecedor)
          .permit(:nome_fornecedor, :endereco, :bairro, :codigo_municipio, :cep, :cnpj, :asn, :codigo_site)
  end

  def find_fornecedor
    @fornecedor = Fornecedor.find(params[:id])
  rescue StandardError => e
    flash[:error] = "Fornecedor não foi encontrado '#{e.message}'"
    render 'layouts/not_found'
  end

  def load_tabelas_secundarias
    @tabelas_secundarias = load_tabelas_secundarias_template(Fornecedor)
  end
end
