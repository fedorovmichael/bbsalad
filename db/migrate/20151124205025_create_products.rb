class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :overview
      t.float :price
      t.string :type
      t.boolean :new
      t.boolean :favorits

      t.timestamps null: false
    end
  end
end
