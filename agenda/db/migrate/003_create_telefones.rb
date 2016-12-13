class CreateTelefones < ActiveRecord::Migration
  def self.up
    create_table :telefones do |t|
      t.string :numero
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :telefones
  end
end
