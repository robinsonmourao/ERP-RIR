class SitesController < CrudTemplateController
  before_action :buscar_site, only: [:show, :edit, :update, :destroy]
  before_action :new, only: [:create]
  before_action :load_tabelas_secundarias, only: [:new, :edit, :create]

  def index
    index_template(Site)
  end

  def new
    @site = Site.new
  end

  def show
    show_template(@site)
  end

  def create
    create_template(@site, site_params)
  end

  def update
    update_template(@site, site_params)
  end

  def destroy
    destroy_template(@site)
  end

  private

  def site_params
    params.require(:site).permit(:designacao, :codigo_cliente, :nome_site, :endereco, :bairro, :codigo_municipio,
                                 :cep, :coordenadalt, :coordenadalg, :velocidade_contratada, :codigo_tipo_link,
                                 :sla, :valor_mensal, :valor_instalacao)
  end

  def buscar_site
    @site = Site.find(params[:id])
  rescue StandardError => e
    flash[:error] = "Site não foi encontrado '#{e.message}'"
    render 'layouts/not_found'
  end

  def load_tabelas_secundarias
    @tabelas_secundarias = load_tabelas_secundarias_template(Site)
  end
end
