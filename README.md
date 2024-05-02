# Demonstrações

## Telas

### Cadastrar
![Cadastrar](https://raw.githubusercontent.com/robinsonmourao/RIX-system/main/app/assets/images/demo-cadastrar.png)

### Entrar
![Entrar](https://raw.githubusercontent.com/robinsonmourao/RIX-system/main/app/assets/images/demo-entrar.png)

### Visão geral da conta
![Entrar](https://raw.githubusercontent.com/robinsonmourao/RIX-system/main/app/assets/images/demo-usuário.png)


# Estrutura de arquivos

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

- **models** -> Contém modelos do modelo [M]VC
  - `application_record.rb` -> modelo principal do Rails

- **views** -> Contém visões do modelo M[V]C

- **db**
  - `migrate`
    - `<000000000000XX_create_<nome-tabela>>` -> Scripts SQL
    - `...`
  - `schema.rb` -> Esquema completo de migração <br>

# Status de desenvolvimento

| Tarefa             | Status        | Progresso                         |
|--------------------|--------------|---------------------------------------|
| `Desenvolvimento da API`    | PROGRESSO     | -              |
| `Testes unitários`          | PENDENTE      | -              |
| `Testes E2E(Ponta a ponta)` | PENDENTE      | -              |
| `Documentação readme.md`    | PENDENTE      | -              |
| `Casos de uso`              | PENDENTE      | -              |
| `Fluxo de eventos`          | PENDENTE      | -              |
| `Fluxos alternativos`       | PENDENTE      | -              |
| `Fluxos de exceção`         | PENDENTE      | -              |
| `Containerização  `         | PENDENTE      | -              |
| `Hospedagem`                | PENDENTE      | -              |