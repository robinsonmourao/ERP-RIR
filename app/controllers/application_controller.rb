include ApplicationHelper, Permissao, Categoria, 
        ModuloMeioContato, ModuloExistenciaNotaFiscal, ModuleIP, ModuleLink, ModuleSituacao, ModuleInstalacao

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, only: [:login, :logout]

  def login
    @usuario = Usuario.find_by(nome: params[:nome])
    if @usuario
      autenticar(@usuario)
    else
      flash[:notice] = "Usuário '#{params[:nome]}' não encontrado!"
      redirect_to entrar_path
    end
  end

  def autenticar(usuario)
    if usuario.authenticate(params[:password])
      session[:codigo_usuario] = usuario.codigo_usuario

      flash[:success] = "Bem-vindo, #{usuario.nome}!"
      redirect_to dashboard_path
    end
  end

  def logout
    if session[:codigo_usuario]
      session[:codigo_usuario] = nil

      flash[:notice] = 'Você foi desconectado!'
    else
      flash[:error] = 'A sessão que você quis fechar já não existia previamente!'
    end
    redirect_to root_path
  end
end
