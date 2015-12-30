class AddProductIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :product_id, :string
  end
end
