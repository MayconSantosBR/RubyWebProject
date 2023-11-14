class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name
      t.integer :personType
      t.string :cpfCnpj
      t.string :cellphone

      t.timestamps
    end
    add_index :people, :cpfCnpj, unique: true
  end
end
