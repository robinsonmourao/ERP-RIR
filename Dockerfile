# Use a imagem oficial do Ruby como base
FROM ruby:3.3.1-slim-bullseye

# Instale dependências do sistema
RUN apt-get update -qq && apt-get install -y nodejs sqlite3 build-essential
RUN gem install bundler -v '2.5.9'

# Configurar o diretório de trabalho
WORKDIR /app

# Copiar o Gemfile e Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Instalar gems
RUN bundle install

# Copiar o restante do código da aplicação
COPY . .

# Precompilar assets (se necessário)
RUN RAILS_ENV=development bundle exec rake assets:precompile

# Migrar e criar valores iniciais necessários
RUN rails db:migrate && rails db:seed

# Expor a porta que o servidor Rails irá rodar
EXPOSE 3000

# Comando para iniciar o servidor
CMD ["rails", "server", "-b", "0.0.0.0"]
