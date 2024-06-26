module Permissao
  SUPER = 1; ADMINISTRATIVO = 2; TECNICO = 3; CONSULTA = 4
  PERMISSOES = {
    SUPER => 'Super', ADMINISTRATIVO => 'Administrativo', TECNICO => 'Tecnico', CONSULTA => 'Consulta'
  }
end

module Categoria
  ATENDIMENTO = 'a'; CLIENTE = 'c'; FORNECEDOR = 'f'; SITE = 's'
end

module ModuloMeioContato
  EMAIL = 'email'; TELEFONE = 'telefone'; WHATSAPP = 'whatsapp'
end

module ModuloExistenciaNotaFiscal
  NOTA_FISCAL_INEXISTENTE = 0; NOTA_FISCAL_EXISTENTE = 1
end

module ModuleIP
  IP_FIXO = 1; IP_DINAMICO = 2
end

module ModuleLink
  LINK_PRINCIPAL = 1; LINK_BACKUP = 2
end

module ModuleSituacao
  ATIVO = 1; CANCELADO = 2; SUSPENSO = 3; BLOQUEADO = 4; PENDENTE = 5
  SITUACAO_DESCRICOES = {
    ATIVO => 'Ativo', CANCELADO => 'Cancelado', SUSPENSO => 'Suspenso', BLOQUEADO => 'Bloqueado', PENDENTE => 'Pendente'
  }
end

module ModuleInstalacao
  NAO = 0; SIM = 1
end
