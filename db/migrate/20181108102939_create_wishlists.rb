class CreateWishlists < ActiveRecord::Migration[5.2]
  def change
    create_table :wishlists do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end