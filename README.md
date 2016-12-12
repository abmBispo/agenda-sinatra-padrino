# Agenda Pessoal

### Uma API da Agenda Pessoal em Sinatra/Padrino
Abaixo estará a descrição, _commit a commit_, de como o sistema da API da Agenda Pessoal foi desenvolvido. Para isso, há alguns pré-requisitos a necessários anteriores ao 1º commit. O sistema foi desenvolvido no Linux Ubuntu 16.04, usando a instalação do ruby provida em `docs/ruby_install.sh`

#### 1º commit - criando o projeto
Primeiro criamos a pasta `docs` lá pusemos o *bash script* para instalação e configuração correta do Ruby. O repositório vazio recebeu então o aplicativo Sinatra/Padrino gerado pelo comando `padrino g project agenda -d activerecord -a mysql`. Foi adicionada a linha abaixo ao Gemfile e usado o comando `bundle install --binstubs` para gerar as dependências do projeto:

    gem 'json', '~> 2.0', '>= 2.0.2'

Por último foi adicionado ao arquivo `.gitignore` o diretório criado `bin` na raiz do projeto Padrino.
