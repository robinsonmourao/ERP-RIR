class SitesController < ApplicationController
  before_action :buscar_site, only: [:show, :edit, :update, :destroy]

  def index
    @sites = Site.all
    unless @sites.any?
      render 'layouts/not_found'
    end
  end

  def new
    @clientes = Cliente.all
    @municipios = Municipio.all
    @tipo_links = TipoLink.all

    @site = Site.new
  end

  def show
  rescue StandardError => e
    flash[:error] = "Site não encontrado: '#{e.message}'"
    render 'layouts/not_found'
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      flash[:success] = "O site '#{@site.nome_site}' foi criado com sucesso."
      redirect_to @site
    else
      flash[:notice] = "Informe um SITE com uma DESIGNAÇÃO diferente de: '#{@site.designacao}'"
      render 'new'
    end
  rescue StandardError => e
    flash[:error] = "Ocorreu um erro interno: '#{e.message}'"
    render 'new'
  end

  def update
    if @site.update(site_params)
      flash[:success] = "O site '#{@site.nome_site}' foi atualizado com sucesso!"
      redirect_to @site
    else
      flash[:error] = "Não foi possível ATUALIZAR o SITE pois a DESIGNAÇÃO '#{@site.designacao}' já está em uso!"
      render 'edit'
    end
  rescue StandardError => e
    flash[:error] = "Ocorreu um erro interno: '#{e.message}'"
    render 'new'
  end

  def destroy
    if @site.destroy
      flash[:success] = "o SITE #{@site.nome_site} foi deletado com sucesso."
    else
      flash[:notice] = 'Não foi possível deletar site!'
    end
    redirect_to sites_path
  rescue StandardError => e
    flash[:error] = "Site não encontrado: '#{e.message}'"
    redirect_to sites_path
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
