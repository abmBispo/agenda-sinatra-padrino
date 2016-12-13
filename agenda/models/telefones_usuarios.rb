class TelefonesUsuarios < ActiveRecord::Base
  has_one :telefones
  has_one :usuarios
end
