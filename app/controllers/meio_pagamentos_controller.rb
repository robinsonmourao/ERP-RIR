class MeioPagamentosController < CrudTemplateSecundariasController
  before_action :new, only: [:create]

  def new
    @meio_pagamento = MeioPagamento.new
  end

  def create
    create_template_secundarias(@meio_pagamento, 'descricao', meio_pagamento_params)
  end

  private

  def meio_pagamento_params
    params.permit(:descricao)
  end

  def find_grupo
    @meio_pagamento = find_object(MeioPagamento, params)
  end
end
