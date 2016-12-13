class CreateEnderecos < ActiveRecord::Migration
  def self.up
    create_table :enderecos do |t|
      t.string :logradouro
      t.string :cidade
      t.string :estado
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :enderecos
  end
end
