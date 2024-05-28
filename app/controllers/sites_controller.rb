class SitesController < ApplicationController
  before_action :buscar_contato, only: [:show]

  def index
    @sites = Site.all
    unless @sites.any?
      render 'layouts/not_found'
    end
  end

  def new
    @cliente = Cliente.all
    @municipio = Municipio.all
    @tipo_link = TipoLink.all

    @site = Site.new
  end

  def create
    @site = Site.new(params[:site])
    if @site.save
      flash[:success] = "Um site com '#{@site.nome_site}' foi criado com sucesso."
      redirect_to @site
    else
      flash[:error] = 'Não foi possível salvar o site.'
      render 'new'
    end
  end

  def show
    @sites = Site.find(params[:id])
  rescue StandardError => e
    flash[:error] = "Site não encontrado: '#{e.message}'"
    render 'layouts/not_found'
  end

  private

  def site_params
    params.require(:site).permit(:designacao, :codigo_cliente, :nome_site, :endereco, :bairro, :codigo_municipio,
                                 :cep, :coordenadalt, :coordenadalg, :velocidade_contratada,
                                 :codigo_tipo_link, :sla, :valor_mensal, :valor_instalacao)
  end

  def buscar_site
    @site = Site.find(params[:id])
  rescue StandardError => e
    flash[:error] = "Site não foi encontrado '#{e.message}'"
    render 'layouts/not_found'
  end
end
