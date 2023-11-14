class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.references :people, foreign_key: true

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
