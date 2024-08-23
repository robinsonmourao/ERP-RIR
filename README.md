# Planejamento
## Roteiro de testes
https://github.com/robinsonmourao/ERP-RIR/blob/end-to-end-tests_CUCUMBER/RoteiroDeTestes.md


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
