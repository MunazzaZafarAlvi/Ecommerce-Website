class CreateSizes < ActiveRecord::Migration[7.1]
  def change
    create_table :sizes do |t|
      t.integer :name

      t.timestamps
    end
  end
end
