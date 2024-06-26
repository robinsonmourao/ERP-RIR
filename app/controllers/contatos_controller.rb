class ContatosController < CrudTemplateController
  before_action :buscar_contato, only: [:show, :edit, :update, :destroy]
  before_action :new, only: [:create]
  before_action :load_tabelas_secundarias, only: [:new, :edit, :create]

  def index
    index_template(Contato)
  end

  def new
    @tipo_contatos = TipoContato.all
    @meio_contatos = MeioContato.all

    @contato = Contato.new
  end

  def create
    create_template(@contato, "nome_pessoa", contato_params)
  end

  def update
    update_template(@contato, "nome_pessoa", contato_params)
  end

  def destroy
    destroy_template(@contato, "nome_pessoa")
  end

  private

  def contato_params
    params.require(:contato).permit(:tabela, :codigo_tipo_contato, :codigo_meio_contato, :nome_pessoa, :descricao, :observacao)
  end

  def buscar_contato
    @contato = Contato.find(params[:id])
  rescue StandardError => e
    flash[:error] = "Contato não foi encontrado '#{e.message}'"
    render 'layouts/not_found'
  end

  def load_tabelas_secundarias
    @tabelas_secundarias = load_tabelas_secundarias_template(Contato)
  end
end
