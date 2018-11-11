class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :link
      t.string :image
      t.decimal :price
      t.integer :rating

      t.timestamps
    end
  end
end
