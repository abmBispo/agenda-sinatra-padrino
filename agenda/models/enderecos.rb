class Enderecos < ActiveRecord::Base
  has_and_belongs_to_many :usuarios
end
