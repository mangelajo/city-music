class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.references :city, null: false, foreign_key: true
      t.string :street
      t.string :postalCode
      t.string :phone
      t.text :description
      t.string :website
      t.float :rating
      t.integer :capacity

      t.timestamps
    end
  end
end
