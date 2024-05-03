class MeioContatosController < ApplicationController
  def index
    @meio_contato = MeioContato.all
  end

  def show
    @meio_contato = MeioContato.find(meio_contato_params[:codigo_tipo_contato])
  end

  def new
    @meio_contato = MeioContato.new
  end

  def create
    @meio_contato = MeioContato.new(meio_contato_params)
    if @meio_contato.save
      flash[:success] = "MeioContato successfully created"
      redirect_to dashboard_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  private

  def meio_contato_params
    params.require(:meio_contato).permit(:descricao)
  end
end
