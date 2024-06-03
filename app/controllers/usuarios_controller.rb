class UsuariosController < CrudTemplateController
  before_action :check_active_session, only: [:show]
  before_action :find_usuario, only: [:show]

  def new
    new_template(Usuario)
  end

  def show
    @usuario = current_usuario
  end

  def create
    @usuario = Usuario.new(usuario_params)

    create_template(@usuario, 'nome', usuario_params)
  end

  private

  def usuario_params
    params.permit(:password, :nome, :permissao)
  end

  def find_usuario
    find_object(Usuario, params)
  end
end
