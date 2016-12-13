class CreateContatos < ActiveRecord::Migration
  def self.up
    create_table :contatos do |t|
      t.integer :usuario_id
      t.integer :contato_id
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :contatos
  end
end
