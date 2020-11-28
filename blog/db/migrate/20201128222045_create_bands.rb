class CreateBands < ActiveRecord::Migration[6.0]
  def change
    create_table :bands do |t|
      t.string :name
      t.string :website
      t.text :description
      t.float :rating

      t.timestamps
    end
  end
end
