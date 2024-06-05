class SitesController < CrudTemplateController
  before_action :buscar_site, only: [:show, :edit, :update, :destroy]
  before_action :new, only: [:create]

  def index
    index_template(Site)
  end

  def new
    @site = Site.new
  end

  def create
    create_template(@site, 'designacao', site_params)
  end

  def update
    update_template(@site, 'designacao', site_params)
  end

  def destroy
    destroy_template(@site, 'designacao')
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
end
