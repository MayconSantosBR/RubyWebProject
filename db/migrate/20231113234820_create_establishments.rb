class CreateEstablishments < ActiveRecord::Migration[5.2]
  def change
    create_table :establishments do |t|
      t.text :street
      t.text :neighborhood
      t.integer :number
      t.references :people, foreign_key: true

      t.timestamps
    end
  end
end
