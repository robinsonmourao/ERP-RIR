class FornecedoresController < CrudTemplateController
  before_action :find_fornecedor, only: [:show, :edit, :update, :destroy]
  before_action :new, only: [:create]

  def index
    index_template(Fornecedor)
  end

  def show
  end

  def new
    @fornecedor = Fornecedor.new
  end

  def create
    create_template(@fornecedor, 'nome_fornecedor', fornecedor_params)
  end

  def update
    update_template(@fornecedor, 'nome_fornecedor', fornecedor_params)
  end

  def destroy
    destroy_template(@fornecedor, 'nome_fornecedor')
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
end
