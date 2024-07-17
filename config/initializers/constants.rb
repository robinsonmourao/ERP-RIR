module Permissao
  SUPER = 1; ADMINISTRATIVO = 2; TECNICO = 3; CONSULTA = 4
  PERMISSOES = {
    SUPER => 'Super', ADMINISTRATIVO => 'Administrativo', TECNICO => 'Tecnico', CONSULTA => 'Consulta'
  }
end

module Categoria
  ATENDIMENTO = 'a'; CLIENTE = 'c'; FORNECEDOR = 'f'; SITE = 's'
end

module ModuloExistenciaNotaFiscal
  NOTA_FISCAL_INEXISTENTE = 0; NOTA_FISCAL_EXISTENTE = 1
  NOTA_FISCAL = {
    NOTA_FISCAL_INEXISTENTE => 'Inexistente', NOTA_FISCAL_EXISTENTE => 'Existente'
  }
end

module ModuleIP
  IP_FIXO = 1; IP_DINAMICO = 2
  IP = {
    IP_FIXO => 'IP fixo', IP_DINAMICO => 'IP Dinâmico'
  }
end

module ModuleLink
  LINK_PRINCIPAL = 1; LINK_BACKUP = 2
  MODALIDADE = {
    LINK_PRINCIPAL => 'Principal', LINK_BACKUP => 'Backup'
  }
end

module ModuleInstalacao
  NAO = 0; SIM = 1
end
