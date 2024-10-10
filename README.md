# Planejamento
## Roteiro de testes
https://github.com/robinsonmourao/ERP-RIR/blob/end-to-end-tests_CUCUMBER/RoteiroDeTestes.md

# Demonstrações

## Telas
### Cadastrar
![Cadastrar](https://github.com/robinsonmourao/ERP-RIR/blob/main/app/assets/images/demo-cadastrar.png?raw=true)

### Entrar
![Entrar](https://github.com/robinsonmourao/ERP-RIR/blob/main/app/assets/images/demo-entrar.png)

### Criação de contatos
![CadastroContatos](https://github.com/robinsonmourao/ERP-RIR/blob/main/app/assets/images/demo-cadastro-contatos.png)

### Lista de contatos
![Contatos](https://github.com/robinsonmourao/ERP-RIR/blob/main/app/assets/images/demo-lista-contatos.png)

### Visão geral da conta
![Usuarios](https://github.com/robinsonmourao/ERP-RIR/blob/main/app/assets/images/demo-vis%C3%A3o-geral-da-conta.png)


# Estruturas

## Arquivos

- **.vscode** -> Contém arquivos de configurações da IDE Visual Studio Code
  - `settings.json` -> Configuração da IDE Visual Studio Code

- **assets** -> Contém imagens, sintaxe JavaScript e estilos CSS
  - `images` -> Contém imagens
    - `demo-cadastrar` -> Imagem de demonstração da tela de cadastro de usuários
    - `demo-entrar` -> Imagem de demonstração da tela de acesso dos usuários ao sistema RIX
  - `javascripts` -> Contém sintaxe JavaScript
  - `stylesheets` -> Contém estilos CSS
    - `custom_styles.css` -> Arquivo de estilos CSS

- **controllers** -> Contém controladores do modelo MV[C]
  - `application_controller.rb` -> Controlador principal da aplicação
  - `<...>_controller.rb` -> Controladores

- **helpers** -> Contém os métodos auxiliares para utilização da aplicação
  - `application_helper.rb` -> Métodos auxiliares para utilização da aplicação

- **models** -> Contém modelos do modelo [M]VC
  - `application_record.rb` -> modelo principal do Rails
  - `<...>.rb` -> Controladores

- **views** -> Contém visões do modelo M[V]C
  - `builders` -> Builders da aplicação
    - `render_sheets` -> Pasta com o arquivo de renderização unificado para planilhamento de TODOS os objetos
      - `_details_sheet.html.erb` -> Arquivo de renderização unificado para planilhamento de TODAS as colunas e TODOS os objetos
      - `_sheet.html.erb` -> Arquivo de renderização unificado para planilhamento de TODOS os objetos
    - `render_templates` -> Renderização unificada para TODAS as tabelas principais
    - `render_templates_secundarias` -> Renderização unificada para TODAS as tabelas secundárias
  - `layouts` -> Pasta com o modelo principal
    - `_header.html.erb` -> Visão header(bar e botões)
    - `application.html.erb` -> Visão principal da aplicação
    - `not_found.html.erb` -> Visão unificada para tela de objeto não encontrado
  - `tabelas_secundarias` -> Pasta com as visões de tabelas secundárias
    - `<...>.html.erb` -> Visões secundárias da aplicação
  - `<...>.html.erb` -> Visões das tabelas principais

- **config**
 - `initializers` -> Pasta com configurações de inicialização da aplicação
    - `constants.rb` -> Constantes essenciais para o funcionamento da aplicação
    - `session_store.rb` -> Configuração do tempo de sessão
  - `routes.rb` -> Configuração das rotas da aplicação <br>

- **db**
  - `migrate` -> Pasta com Scripts SQL
    - `<000000000000XX_create_<nome-tabela>.rb>` -> Scripts SQL
  - `schema.rb` -> Esquema completo de migração <br>

## Árvore de dependência
### Tabelas primárias

- └── atendimentos
  - ├── equipamentos
  - ├── fornecedors (**Obrigatório**)
  - ├── meio_pagamentos
  - ├── status
  - ├── tipo_links
  - └── tecnologia_links

- └── boletos
  - ├── faturas (**Obrigatório**)
  - ├── grupos (**Obrigatório**)
  - ├── statuses (**Obrigatório**)
  - └── local_pagamentos

- └── clientes
  - └── municipios

- └── contatos
  - ├── meio_contatos (**Obrigatório**)
  - └── tipo_contatos (**Obrigatório**)
  
- └── fornecedors
  - └── municipios

- └── sites
  - ├── clientes (**Obrigatório**)
  - ├── municipios
  - └── tipo_links

- └── faturas
  - ├── atendimentos (**Obrigatório**)
  - ├── grupos (**Obrigatório**)
  - ├── statuses (**Obrigatório**)
  - └── meio_pagamentos (**Obrigatório**)

- └── statuses
  - ├── atendimentos OU clientes OU fornecedors OU sites (**Obrigatório**)
  - └── situacoes (**Obrigatório**)

### Tabelas secundárias

- └── municipios
  - └── ufs (**Obrigatório**)

# Banco de dados
Há um endpoint dedicado para envio de instruções SQL o quel pode ser executado utilizando o endereço:
`.../execute_sql?query=<comando-sql>`

# Status de desenvolvimento

| Tarefa             | Status        |
|--------------------|---------------|
| Desenvolvimento da API    | CONCLUÍDO    |
| Roteirização de testes    | CONCLUÍDO    |
| Documentação readme.md    | CONCLUÍDO    |
| Containerização           | CONCLUÍDO    |
| Testes E2E(Ponta a ponta) | PROGRESSO    |
| Casos de uso              | PENDENTE     |
| Fluxo de eventos          | PENDENTE     |
| Fluxos alternativos       | PENDENTE     |
| Fluxos de exceção         | PENDENTE     |
| ~~Hospedagem~~            |FORA DE ESCOPO|
