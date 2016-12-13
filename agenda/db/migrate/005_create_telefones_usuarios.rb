class CreateTelefonesUsuarios < ActiveRecord::Migration
  def self.up
    create_table :telefones_usuarios do |t|
      t.integer :usuario_id
      t.integer :telefone_id
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :telefones_usuarios
  end
end
