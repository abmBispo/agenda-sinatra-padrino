class UsuariosEnderecos < ActiveRecord::Base
  has_one :enderecos
  has_one :usuarios
end
