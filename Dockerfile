FROM ruby:3.3.5

# Dependências do sistema
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Pasta da aplicação
WORKDIR /app

# Gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Código
COPY . .

# Porta da aplicação
EXPOSE 4001

# Comando padrão
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "4001"]
