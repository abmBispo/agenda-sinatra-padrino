class CreateUsuariosEnderecos < ActiveRecord::Migration
  def self.up
    create_table :usuarios_enderecos do |t|
      t.integer :usuario_id
      t.integer :enderecos_id
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :usuarios_enderecos
  end
end
