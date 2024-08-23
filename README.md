# Planejamento
## Roteiro de testes
https://github.com/robinsonmourao/ERP-RIR/blob/end-to-end-tests_CUCUMBER/RoteiroDeTestes.md

# Estruturas
## Pastas

- **.config** -> Contém arquivos de configurações da gem Rubocop
    - `rubocop.yml` -> Configuração da gem Rubocop
- **.vscode** -> Contém arquivos de configurações da IDE Visual Studio Code
    - `settings.json` -> Configuração da IDE Visual Studio Code
- **cypress** -> Pasta principal do Cypress
  - **e2e** -> Contém constantes necessárias para realização de alguns testes
    - **ScenarioXX-<Descrição-do-cenário>** -> Pasta divisória dos cenários
      - **idXX-<Descrição-do-case>.cy.js** -> Código JavaScript necessário para realização dos testes
  - **pages** -> Contém mapeamento de páginas e elementos necessários para realização dos testes
  - **features** -> Contém constantes necessárias para realização dos testes
    - **ScenarioXX-<Descrição-do-cenário>** -> Pasta divisória dos cenários
      - **idXX-Descrição-do-case>.feature** -> Sintaxe BDD necessárias para realização dos testes
  - **support**
    - **pages** -> Pasta com Módulos necessário para realização dos testes
      - **cadastrarPage.js** -> Mapeamento dos elementos da pagina de cadastrar Usuario
    - **commands.js** -> Arquivo de chamada de gatilhos
    - **e2e.js** -> Arquivo de importações
    - **SetUp.js** -> Arquivo para configurações de pre-teste

# Preparação do ambiente [Linux]
## Instalar curl
`sudo apt install curl`

## Instalar nvm via curl
`curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash`

## Verifica versão do nvm
`npm -v`

## Instalar node.js
`nvm install 21.12.1`

## Verificar versão do node
`node -v`

# Criação do projeto
## Inicializar projeto nodejs
`npm init -y`

package.json
## Sempre usar a versão mais recente do JavaScript
### Abaixo de "main"
`"type": "module",`

## Setar a versão especifica do node
### Abaixo de "type"
`"engines": {
  "node": "20.12.1"
},`

# Instala o cypress
`npm i -D cypress@13.7.2`

# Configurações do cypress
### Abaixo de "engines"
`"scripts": {
  // Abrir navegador e visualizar digitando, etc
  "scripts:web": "npx cypress open",
  // Rodar somente via terminal(sem interface)
  "cypress:headless": "npx cypress run --browser electron"
},`


# Rodar cypress
`npm run scripts:web`
OU
`npm run scripts:headless`

Após carregar o cypress carregará a tela 'Welcome to Cypress!', nela 'e2e testing'
Carregará a tela 'Configuration files' clique no botão continue
Carregará a tela 'Choose a browser' escolha um navegador
Carregará no navegador a tela 'Create your first spec' clique em 'Create new spec'

# Configurar o cypress
Acima de 'e2e'
`chromeWebSecurity: false,`
Em e2e
`"e2e": {
  baseUrl: 'http://127.0.0.1:3000/',
  // Não limpa o estado da tela inicial a cada it
  testIsolation: false
}`

# Implementar os testes
## '.cy.js' => '/cypress/e2e/'
## '.feature' => '??'
