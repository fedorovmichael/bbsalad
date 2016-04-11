class CreateSlideshows < ActiveRecord::Migration
  def change
    create_table :slideshows do |t|
      t.string :name
      t.string :link
      t.timestamps null: false
    end
  end
end
