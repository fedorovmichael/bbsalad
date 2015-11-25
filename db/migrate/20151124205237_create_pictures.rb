class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.string :link
      t.string :position

      t.timestamps null: false
    end
  end
end
