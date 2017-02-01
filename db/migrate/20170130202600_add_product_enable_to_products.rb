class AddProductEnableToProducts < ActiveRecord::Migration
  def change
      add_column :products, :enable, :boolean      
  end
end
