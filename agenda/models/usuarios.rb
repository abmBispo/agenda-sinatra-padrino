class Usuarios < ActiveRecord::Base
  has_and_belongs_to_many :contatos
  has_and_belongs_to_many :enderecos
  has_and_belongs_to_many :telefones

  validates_presence_of(:nome)
  validates_presence_of(:login)
  validates_presence_of(:senha)
end
