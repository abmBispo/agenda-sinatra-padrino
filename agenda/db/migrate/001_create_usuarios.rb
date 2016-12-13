class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.string :nome
      t.string :login
      t.string :senha
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :usuarios
  end
end
