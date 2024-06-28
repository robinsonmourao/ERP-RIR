class UsuariosController < CrudTemplateController
  before_action :check_active_session, only: [:show]
  before_action :find_usuario, only: [:show, :destroy]

  def new
  end

  def edit
  end

  def show
    @usuario = current_usuario
  end

  def create
    @usuario = Usuario.new(usuario_params)

    create_template(@usuario, usuario_params)
  end

  def destroy
    if current_usuario && current_usuario.authenticate(params[:usuario][:senha_atual])
      destroy_template(current_usuario)
    else
      flash[:notice] = 'Senha incorreta!'
      redirect_back fallback_location: ''
    end
  end

  private

  def usuario_params
    params.permit(:password, :nome, :permissao)
  end

  def find_usuario
    @usuario = find_object(Usuario, params)
  end
end
