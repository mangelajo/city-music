class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :description
      t.string :website
      t.float :rating

      t.timestamps
    end
  end
end
