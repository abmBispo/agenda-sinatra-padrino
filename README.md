# Agenda Pessoal

### Uma API da Agenda Pessoal em Sinatra/Padrino
Abaixo estará a descrição, _commit a commit_, de como o sistema da API da Agenda Pessoal foi desenvolvido. Para isso, há alguns pré-requisitos a necessários anteriores ao 1º commit. O sistema foi desenvolvido no Linux Ubuntu 16.04, usando a instalação do ruby provida em:
```sh
$ docs/ruby_install.sh
```

#### 1º commit - criando o projeto
Primeiro criamos a pasta `docs` lá pusemos o *bash script* para instalação e configuração correta do Ruby. O repositório vazio recebeu então o aplicativo Sinatra/Padrino gerado pelo comando:
```sh
$ padrino g project agenda -d activerecord -a mysql.
```
Foi adicionada a linha `gem 'json', '~> 2.0', '>= 2.0.2'` ao Gemfile e usado o comando abaixo para gerar as dependências do projeto:
```sh
$ bundle install --binstubs
```

Por último foi adicionado ao arquivo `.gitignore` o diretório criado `bin` na raiz do projeto Padrino.

#### 2º commit - criando o DER
Neste segundo commit produzimos o Diagrama Entidade Relacionamento (DER) e o `create_script.sql`, ambos no diretório `docs/`. Veja o DER abaixo:
![DER][DER]

[DER]: https://github.com/abmBispo/agenda-sinatra-padrino/raw/master/docs/DER.png "DER"

#### 3º commit - criando o database e suas tabelas
A primeira coisa que devemos fazer para criar o DB do nosso projeto através das *rake tasks* é configurar o nosso adaptador. Para este caso, o arquivo de configuração em `config/database.rb` foi modificado para aceitar o banco de dados que viríamos a utilizar. **Importante: foi retirado das configurações o caminho auto gerado até o socket do MySQL.**

Então executamos dentro do diretório `./agenda/` o comando para criar o DB no nosso MySQL local:
```sh
$ bundle exec rake ar:create
```
Após isso nós geramos as tabelas com o construtor do próprio Padrino (muito parecido com o scaffold do Ruby on Rails). Veja a tabela abaixo que relaciona as entidades criadas e seus respectivos comandos.

|  Entidade/Tabela | Comandos     |
| ---------------- |:-------------|
| Usuario          |`padrino g model usuarios nome:string login:string senha:string`|
| Enderecos        | `padrino g model enderecos logradouro:string cidade:string estado:string` |
| Telefones        | `padrino g model telefones numero:string` |
| Contatos        | `padrino g model contatos usuario_id:integer contato_id:integer` |
| Telefones_usuarios|`padrino g model telefones_usuarios usuario_id:integer telefone_id:integer`|
| Usuarios_enderecos| `padrino g model usuarios_enderecos usuario_id:integer enderecos_id:integer` |

Ademais, modificamos os models para receberem as relações corretas, usando `has_one` e `has_and_belongs_to_many`. Assim, por último nós migramos o DB do Ruby para o MySQL com o comando:
```sh
$ padrino rake ar:migrate
```
Isso construiu as tabelas no sistema e gerou o arquivo `db/schema.rb` que mais tarde seria usado para gerar o SQL criador final.git@github.com:abmBispo/sinatra-first-app.git

#### 4º commit - gerando os controllers e helpers
Adicionamos ao `./app/app.rb` a diretiva `set :protect_from_csrf, false`. No entanto, não é seguro fazer o _deploy_ do sistema em servidor para servir de API na _web_ sem esta opção. Foi feito isso apenas para parar o a execução do `Rack::Protection::AuthenticityToken`. Ele bloqueava todas as requisições com o _status 403 forbidden_ pelo fato de não usarmos o protocolo _HTTPS_ e nem o token de autenticidade.
Usamos ademais um comando do Padrino para criar no nosso projeto os _controllers_
para Usuarios:
```sh
$ padrino g controller Usuarios
```
Este comando criou as pastas `./app/controllers/` e `./app/helpers/`, assim como seus respectivos arquivos `usuarios.rb` e `usuarios_helper.rb`. Então construimos neles as rotas e os helpers necessários para o CRUD de Usuarios.
