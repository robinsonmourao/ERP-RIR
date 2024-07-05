# Funcionalidades para Usuário
## Cenário 001 - Cadastrar
|ID   |Objetivo do teste|Pré-condições|Passos|Resultado esperado|Resultado obtido|Automatizado|Informações adicionais|Issue ID
|-----|-----------------|-------------|------|------------------|----------------|------------|----------------------|--------|
|`001`|Validar se é permitido cadastro de usuário com campos válidos|Ter a API levantada|1.Acessar o endpoint `/cadastrar`<br>2.Preencher os campos correspondentes<br>3.Clicar no botão **Enviar**|1.Redicionamento para o _endpoint_ `/dashboard`<br>2.Mensagem **<span style="color: #60FF38;">VERDE</span>** de 'Bem vindo ' + nome informado para o campo 'nome'|Conforme o esperado|Sim|-|-|
|`002`|Validar se é permitido cadastro de usuário informando um 'nome' já existente com demais campos válidos|Ter a API levantada|1.Acessar o endpoint `/cadastrar`<br>2.Preencher os campos correspondentes<br>3.Clicar no botão **Enviar**|Mensagem **<span style="color: #FFB938;">LARANJA</span>** informando que o 'nome' informado está indisponível|Conforme o esperado|Sim|-|-|
|`003`|Validar se é permitido cadastro de usuário sem informar o campo 'nome'|Ter a API levantada|1.Acessar o endpoint `/cadastrar`<br>2.Preencher os campos correspondentes<br>3.Clicar no botão **Enviar**|Mensagem de campo informando que para proceder é necessário preencher o campo 'nome'|Conforme o esperado|Sim|Etapa **Então**, pode melhorar|-|
|`004`|Validar se é permitido cadastro de usuário e senha MENOR que 8 caracteres|Ter a API levantada|1.Acessar o endpoint `/cadastrar`<br>2.Preencher os campos correspondentes<br>3.Clicar no botão **Enviar**|Mensagem **<span style="color: #FFB938;">LARANJA</span>** informando que o tamanho da senha é muito curta|**Falhou**|Sim|-|-|
|`005`|Validar se é permitido cadastro de usuário e senha MAIOR que 12 caracteres|Ter a API levantada|1.Acessar o endpoint `/cadastrar`<br>2.Preencher os campos correspondentes<br>3.Clicar no botão **Enviar**|Mensagem **<span style="color: #FFB938;">LARANJA</span>** informando que o tamanho da senha é muito longa|**Falhou**|Sim|-|-|
|`006`|Validar se é permitido cadastro de usuário sem informar o campo 'senha'|Ter a API levantada|1.Acessar o endpoint `/cadastrar`<br>2.Preencher os campos correspondentes<br>3.Clicar no botão **Enviar**|Mensagem de campo informando que para proceder é necessário preencher o campo 'senha'|Conforme o esperado|Sim|Etapa **Então**, pode melhorar|-|
|`007`|Validar se é permitido cadastro de usuário escolhendo 'Super' da opção de 'permissao'|Ter a API levantada|1.Acessar o endpoint `/cadastrar`<br>2.Preencher os campos correspondentes<br>3.Clicar no botão **Enviar**|1.Redicionamento para o _endpoint_ `/dashboard`<br>2.Mensagem **<span style="color: #60FF38;">VERDE</span>** de 'Bem vindo ' + o nome informado para o campo 'nome'|Conforme o esperado|Sim|-|-|
|`008`|Validar se é permitido cadastro de usuário escolhendo 'Administrativo' da opção de 'permissao'|Ter a API levantada|1.Acessar o endpoint `/cadastrar`<br>2.Preencher os campos correspondentes<br>3.Clicar no botão **Enviar**|1.Redicionamento para o _endpoint_ `/dashboard`<br>2.Mensagem **<span style="color: #60FF38;">VERDE</span>** de 'Bem vindo ' + o nome informado para o campo 'nome'|Conforme o esperado|Sim|-|-|
|`009`|Validar se é permitido cadastro de usuário escolhendo 'Tecnico' da opção de 'permissao'|Ter a API levantada|1.Acessar o endpoint `/cadastrar`<br>2.Preencher os campos correspondentes<br>3.Clicar no botão **Enviar**|1.Redicionamento para o _endpoint_ `/dashboard`<br>2.Mensagem **<span style="color: #60FF38;">VERDE</span>** de 'Bem vindo ' + o nome informado para o campo 'nome'|Conforme o esperado|Sim|-|-|
|`010`|Validar se é permitido cadastro de usuário escolhendo 'Consulta' da opção de 'permissao'|Ter a API levantada|1.Acessar o endpoint `/cadastrar`<br>2.Preencher os campos correspondentes<br>3.Clicar no botão **Enviar**|1.Redicionamento para o _endpoint_ `/dashboard`<br>2.Mensagem **<span style="color: #60FF38;">VERDE</span>** de 'Bem vindo ' + o nome informado para o campo 'nome'|Conforme o esperado|Sim|-|-|
|`011`|Validar se é permitido cadastro de usuário sem escolher opção de 'permissao'|Ter a API levantada|1.Acessar o endpoint `/cadastrar`<br>2.Preencher os campos correspondentes<br>3.Clicar no botão **Enviar**|1.Redicionamento para o _endpoint_ `/dashboard`<br>2.Mensagem **<span style="color: #60FF38;">VERDE</span>** de 'Bem vindo ' + o nome informado para o campo 'nome'|Conforme o esperado|Sim|Etapa **Então**, pode melhorar|-|


## ~~Cenário 002 - Atualizar Cadastro[FORA DE ESCOPO]~~

## Cenário 003 - Entrar
|ID   |Objetivo do teste|Pré-condições|Passos|Resultado esperado|Resultado obtido|Automatizado|Informações adicionais|Issue ID
|-----|-----------------|-------------|------|------------------|----------------|------------|----------------------|--------|
|`001`|Validar se é permitida entrada com usuário cadastrado com campos válidos|1.Ter a API levantada<br>2.Já ter um usuário cadastrado|1.Acessar o endpoint `/entrar`<br>2.Preencher os campos correspondentes<br>3.Clicar em `Enviar`|1.Redicionamento para o _endpoint_ `/dashboard`<br>2.Mensagem **<span style="color: #60FF38;">VERDE</span>** de 'Bem vindo ' concatenado com o nome informado para o campo 'nome'|Conforme o esperado|Sim|-|-|
|`002`|Validar se é permitida entrada com usuário NÃO cadastrado com campos válidos|Ter a API levantada|1.Acessar o endpoint `/entrar`<br>2.Preencher os campos correspondentes<br>3.Clicar em `Enviar`|Mensagem **<span style="color: #FFB938;">LARANJA</span>** informando que o usuário com o nome informado não foi encontrado|Conforme o esperado|Sim|-|-|
|`003`|Validar se é permitida entrada com usuário informando uma senha diferente da cadastrada|1.Ter a API levantada<br>2.Já ter um usuário cadastrado|1.Acessar o endpoint `/entrar`<br>2.Preencher os campos correspondentes<br>3.Clicar em `Enviar`|Mensagem **<span style="color: #FFB938;">LARANJA</span>** informando que a senha está incorreta.|**Falhou**|Sim|Messagem LARANJA inexistente|-|
|`004`|Validar se é permitida entrada com usuário cadastrado sem informar nenhuma senha|1.Ter a API levantada<br>2.Já ter um usuário cadastrado|1.Acessar o endpoint `/entrar`<br>2.Preencher os campos correspondentes<br>3.Clicar em `Enviar`|Mensagem **<span style="color: #FFB938;">LARANJA</span>** informando que a senha está incorreta.|Conforme o esperado|Sim|Etapa **Então**, pode melhorar|-|

## Cenário 004 - Sair
|ID   |Objetivo do teste|Pré-condições|Passos|Resultado esperado|Resultado obtido|Automatizado|Informações adicionais|Issue ID
|-----|-----------------|-------------|------|------------------|----------------|------------|----------------------|--------|
|`001`|Validar se é permitido sair do sistema|1.Ter a API levantada<br>2.Já ter um usuário cadastrado<br>3.Estar logado no sistema|1.Clicar no botão superior-direito `Sair`|1.Redicionamento para tela entrar, com _endpoint_ `/entrar`<br>2.Mensagem **<span style="color: #FFB938;">LARANJA</span>** com os dizeres "Você foi desconectado!"|Conforme o esperado|Sim|-|-|

## Cenário 005 - Descadastramento
|ID   |Objetivo do teste|Pré-condições|Passos|Resultado esperado|Resultado obtido|Automatizado|Informações adicionais|Issue ID
|-----|-----------------|-------------|------|------------------|----------------|------------|----------------------|--------|
|`001`|Validar se é permitido apagar cadastro com campos válidos|1.Ter a API levantada<br>2.Ter entrado no sistema<br>|1.Clicar no botão superior-direito `Visão geral da conta`<br>2.Clicar em `Fechar minha conta`<br>3.Informar a sua senha atual<br>4.Clicar no botão `Fechar conta`|1.Redicionamento para tela entrar, com _endpoint_ `/entrar`<br>2.Mensagem **<span style="color: #60FF38;">VERDE</span>** com os dizeres "O Usuário de nome X foi apagado com sucesso."|Conforme o esperado*|Sim|**VEM A MENSAGEM COM OS DIZERES 'Você foi desconectado!' ACUMULADA POR TRÁS**|-|
|`002`|Validar se é permitido apagar cadastro com 'senha' incorreta|1.Ter a API levantada<br>2.Ter entrado no sistema<br>|1.Clicar no botão superior-direito `Visão geral da conta`<br>2.Clicar em `Fechar minha conta`<br>3.Informar a sua senha atual<br>4.Clicar no botão `Fechar conta`|1.Mensagem **<span style="color: #FFB938;">LARANJA</span>** com os dizeres "Senha incorreta!"|Conforme o esperado|Sim|-|-|
|`003`|Validar se é permitido apagar cadastro sem informar nenhum valor para o campo 'senha'|1.Ter a API levantada<br>2.Ter entrado no sistema<br>|1.Clicar no botão superior-direito `Visão geral da conta`<br>2.Clicar em `Fechar minha conta`<br>3.Informar a sua senha atual<br>4.Clicar no botão `Fechar conta`|1.Mensagem de campo informando que para proceder é necessário informar a senha atual|Conforme o esperado*|Sim|A conta não foi removida, porém o campo deve estar disposto como **required** ao invés de só lançar mensagem Laranja|-|

# Funcionalidades para Atendimento
## Cenário 006 - Criar
|ID   |Objetivo do teste|Pré-condições|Passos|Resultado esperado|Resultado obtido|Automatizado|Informações adicionais|Issue ID
|-----|-----------------|-------------|------|------------------|----------------|------------|----------------------|--------|
|`001`|Validar se é permitido cadastrar um novo atendimento com campos válidos|1.Ter a API levantada<br>2.Acessar o endpoint `/atendimentos/new`<br>3.Ter criado previamente um:<br>`a.Cliente`<br>`b.Site`<br>`c.Fornecedor`|1.Preencher os campos obrigatórios:<br>`a.Site`<br>`b.Fornecedor`<br>`c.Velocidade de download`<br>2.Clicar no botão **Enviar**|1.Redicionamento para o _endpoint_ `/atendimentos`<br>2.Mensagem **<span style="color: #60FF38;">VERDE</span>** contendo o valor da designação e a informação de que o atendimento foi criado com sucesso|-|-|-|-|
|`002`|Validar obrigatoriedade para valor 'Site', demais campos válidos|1.Ter a API levantada<br>2.Acessar o endpoint `/atendimentos/new`<br>3.Ter criado previamente um:<br>`a.Cliente`<br>`b.Fornecedor`|1.Preencher os campos obrigatórios:<br>`a.Fornecedor`<br>`b.Velocidade de download`<br>2.Clicar no botão **Enviar**|Alerta informando que é obrigatório selecionar um item para 'Site'|-|-|-|-|
|`003`|Validar obrigatoriedade para 'Fornecedor', demais campos válidos|1.Ter a API levantada<br>2.Acessar o endpoint `/atendimentos/new`<br>3.Ter criado previamente um:<br>`a.Cliente`<br>`b.Site`|1.Preencher os campos obrigatórios:<br>`a.Site`<br>`b.Velocidade de download`<br>2.Clicar no botão **Enviar**|Alerta informando que é obrigatório selecionar um item para 'Fornecedor'|-|-|-|-|
|`004`|Validar obrigatoriedade para 'Velocidade de download', demais campos válidos|1.Ter a API levantada<br>2.Acessar o endpoint `/atendimentos/new`<br>3.Ter criado previamente um:<br>`a.Cliente`<br>`b.Site`<br>`c.Fornecedor`|1.Preencher os campos obrigatórios:<br>`a.Site`<br>`b.Fornecedor`<br>2.Clicar no botão **Enviar**|Alerta informando que é obrigatório preencher o campo 'Velocidade de download'|-|-|-|-|
|`005`|Validar obrigatoriedade de preencher 'IP fixo' CASO 'Categoria do IP' seja `IP fixo`, demais campos válidos|1.Ter a API levantada<br>2.Acessar o endpoint `/atendimentos/new`<br>3.Ter criado previamente um:<br>`a.Cliente`<br>`b.Site`<br>`c.Fornecedor`|1.Preencher os campos obrigatórios:<br>`a.Site`<br>`b.Fornecedor`<br>`c.Velocidade de download`<br>2.Clicar no botão **Enviar**|Alerta informando que é obrigatório preencher o campo 'IP fixo'|-|-|-|-|
|`006`|Validar montagem de chave composta <001`designação` 002`nome do fornecedor`>, campos válidos|1.Ter a API levantada<br>2.Acessar o endpoint `/atendimentos/new`<br>3.Ter criado previamente um:<br>`a.Cliente`<br>`b.Site`<br>`c.Fornecedor`|1.Preencher os campos obrigatórios:<br>`a.Site`<br>`b.Fornecedor`<br>`c.Velocidade de download`<br>2.Clicar no botão **Enviar**|1.Redicionamento para o _endpoint_ `/atendimentos`<br>2.Mensagem **<span style="color: #60FF38;">VERDE</span>** contendo o valor da designação e a informação de que o atendimento foi criado com sucesso<br>3.Valor na planilha para chave composta seguindo a estrutura <001+`designação informada` + `" "` +002+`nome do fornecedor informado`>|**Falhou**|-|No lugar de `nome do fornecedor` foi retornado `id do fornecedor`|-|

## Cenário 007 - Visualizar
|ID   |Objetivo do teste|Pré-condições|Passos|Resultado esperado|Resultado obtido|Automatizado|Informações adicionais|Issue ID
|-----|-----------------|-------------|------|------------------|----------------|------------|----------------------|--------|
|`001`|Validar se é permitido visualizar detalhes de atendimento|1.Ter a API levantada<br>2.Acessar o endpoint `/atendimentos`<br>3.Ter criado previamente um:<br>`a.Cliente`<br>`b.Site`<br>`c.Fornecedor`<br>`d.Atendimento`|Clicar no link azul **<span style="color: #0908E7;">Detalhes</span>** do atendimento desejado|Exibição de todas as colunas do Atendimento|**Falhou**|-|Está sendo exibido apenas o código composto(valor único)|-|

## Cenário 008 - Atualizar
|ID   |Objetivo do teste|Pré-condições|Passos|Resultado esperado|Resultado obtido|Automatizado|Informações adicionais|Issue ID
|-----|-----------------|-------------|------|------------------|----------------|------------|----------------------|--------|
|`001`|Validar se é permitido atualizar um atendimento com campos válidos|1.Ter a API levantada<br>2.Ter criado previamente um:<br>`a.Cliente`<br>`b.Site`<br>`c.Fornecedor`<br>`d.Atendimento`<br>3.Ter clicado no _link_ `editar` do atendimento criado|1.Preencher os campos obrigatórios:<br>`a.Site`<br>`b.Fornecedor`<br>`c.Velocidade de download`<br>2.Clicar no botão **Enviar**|1.Redicionamento para o Atendimento atualizado em planilha<br>2.Mensagem **<span style="color: #60FF38;">VERDE</span>** contendo o valor da designação e a informação de que o atendimento foi atualizado com sucesso|-|-|-|-|
|`002`|Validar obrigatoriedade para valor 'Site', demais campos válidos|1.Ter a API levantada<br>2.Ter criado previamente um:<br>`a.Cliente`<br>`b.Fornecedor`<br>`c.Atendimento`<br>3.Ter clicado no _link_ `editar` do atendimento criado|1.Preencher os campos obrigatórios:<br>`a.Fornecedor`<br>`b.Velocidade de download`<br>2.Remover a opção para 'Site'<br>3.Clicar no botão **Enviar**|Alerta informando que é obrigatório selecionar um item para 'Site'|-|-|-|-|
|`003`|Validar obrigatoriedade para valor 'Fornecedor', demais campos válidos|1.Ter a API levantada<br>2.Ter criado previamente um:<br>`a.Cliente`<br>`b.Site`<br>`c.Atendimento`<br>3.Ter clicado no _link_ `editar` do atendimento criado|1.Preencher os campos obrigatórios:<br>`a.Site`<br>`b.Velocidade de download`<br>2.Remover a opção para 'Fornecedor'<br>3.Clicar no botão **Enviar**|Alerta informando que é obrigatório selecionar um item para 'Fornecedor'|-|-|-|-|
|`004`|Validar obrigatoriedade para valor 'Velocidade de download', demais campos válidos|1.Ter a API levantada<br>2.Ter criado previamente um:<br>`a.Cliente`<br>`b.Site`<br>`c.Fornecedor`<br>`d.Atendimento`<br>3.Ter clicado no _link_ `editar` do atendimento criado|1.Preencher os campos obrigatórios:<br>`a.Site`<br>`b.Fornecedor`<br>2.Apagar o valor atual de campo 'Velocidade de download'<br>2.Clicar no botão **Enviar**|Alerta informando que é obrigatório preencher o campo 'Velocidade de download'|-|-|-|-|
|`005`|Validar obrigatoriedade de preencher 'IP fixo' CASO 'Categoria do IP' seja `IP fixo`, demais campos válidos|1.Ter a API levantada<br>2.Ter criado previamente um:<br>`a.Cliente`<br>`b.Site`<br>`c.Fornecedor`<br>`d.Atendimento`<br>3.Ter clicado no _link_ `editar` do atendimento criado|1.Preencher os campos obrigatórios:<br>`a.Site`<br>`b.Fornecedor`<br>`c.Velocidade de download`<br>2.Selecionar a opção 'IP fixo'<br>3.Apagar o valor atual de campo 'IP fixo'<br>4.Clicar no botão **Enviar**|Alerta informando que é obrigatório preencher o campo 'IP fixo'|-|-|-|-|
|`006`|Validar montagem de chave composta <001`designação` 002`nome do fornecedor`>, campos válidos|1.Ter a API levantada<br>2.Ter criado previamente um:<br>`a.Cliente`<br>`b.Site`<br>`c.Fornecedor`<br>`d.Atendimento`<br>3.Ter clicado no _link_ `editar` do atendimento criado|1.Preencher os campos obrigatórios:<br>`a.Site`<br>`b.Fornecedor`<br>`c.Velocidade de download`<br>2.Clicar no botão **Enviar**|1.Redicionamento para o Atendimento atualizado em planilha<br>2.Mensagem **<span style="color: #60FF38;">VERDE</span>** contendo o valor da designação e a informação de que o atendimento foi criado com sucesso<br>3.Valor na planilha para chave composta seguindo a estrutura <001+`designação informada` + `" "` +002+`nome do fornecedor informado`>|**Falhou**|-|No lugar de `nome do fornecedor` foi retornado `id do fornecedor`|-|

## Cenário 009 - Deletar
|ID   |Objetivo do teste|Pré-condições|Passos|Resultado esperado|Resultado obtido|Automatizado|Informações adicionais|Issue ID
|-----|-----------------|-------------|------|------------------|----------------|------------|----------------------|--------|
|`001`|Validar se é permitido deletar um atendimento|1.Ter a API levantada<br>2.Acessar o endpoint `/atendimentos`<br>3.Ter criado previamente um:<br>`a.Cliente`<br>`b.Site`<br>`c.Fornecedor`<br>`d.Atendimento`|1.Clicar no link vermelho **<span style="color: crimson;">Apagar</span>** do atendimento desejado<br>2. Clicar em OK para confirmar a remoção do Atendimento|Mensagem com o valor da designação informando que o Atendimento foi apagado com sucesso|-|-|-|[#1](https://github.com/robinsonmourao/ERP-RIR/issues/1)|










































# Template
|ID   |Objetivo do teste|Pré-condições|Passos|Resultado esperado|Resultado obtido|Automatizado|Informações adicionais|Issue ID
|-----|-----------------|-------------|------|------------------|----------------|------------|----------------------|--------|
|-|-|-|-|-|-|-|-|-|