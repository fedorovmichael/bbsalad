class SetDefaultValueForEnable < ActiveRecord::Migration
  def change
      change_column :products, :enable, :boolean, :default => false
  end
end
