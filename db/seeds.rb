Equipamento.create(['RB750R2', 'RB750GR3', 'RB750', 'RB750G', 'RB750GL'].map { |d| { descricao: d } })
Grupo.create([{ descricao: 'Fatura não agrupada' }])
LocalPagamento.create(['Sicoob', 'Banco do Brasil', 'Bradesco', 'CEF', 'Pessoalmente'].map { |d| { descricao: d } })
MeioContato.create(['Email', 'Telefone', 'Whatsapp'].map { |d| { descricao: d } })
MeioPagamento.create(['Boleto', 'Pix'].map { |d| { descricao: d } })
Situacao.create(['Ativo', 'Cancelado', 'Suspenso', 'Bloqueado', 'Pendente'].map { |d| { descricao: d } })
TecnologiaLink.create(['Fibra', 'Rádio', 'Cabo'].map { |d| { descricao: d } })
TipoContato.create(['Administrativo', 'Comercial', 'Dono', 'Financeiro', 'Suporte', 'Técnico'].map { |d| { descricao: d } })
TipoLink.create(['IP dedicado', 'Banda Larga', 'VPN'].map { |d| { descricao: d } })
Uf.create([['AC', 'Acre'], ['AL', 'Alagoas'], ['AM', 'Amazonas'], ['AP', 'Amapá'],
           ['BA', 'Bahia'],
           ['CE', 'Ceará'],
           ['DF', 'Distrito Federal'],
           ['ES', 'Espírito Santo'],
           ['GO', 'Goiás'],
           ['MA', 'Maranhão'], ['MG', 'Minas Gerais'], ['MS', 'Mato Grosso do Sul'], ['MT', 'Mato Grosso'],
           ['PA', 'Pará'], ['PB', 'Paraíba'], ['PE', 'Pernambuco'], ['PI', 'Piauí'], ['PR', 'Paraná'],
           ['RJ', 'Rio de Janeiro'], ['RN', 'Rio Grande do Norte'], ['RO', 'Rondônia'], ['RR', 'Roraima'], ['RS', 'Rio Grande do Sul'],
           ['SC', 'Santa Catarina'], ['SE', 'Sergipe'], ['SP', 'São Paulo'],
           ['TO', 'Tocantins']].map { |s, n_e| { sigla: s, nome_estado: n_e } })
