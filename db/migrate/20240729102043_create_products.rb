class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :body_description
      t.integer :price
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
