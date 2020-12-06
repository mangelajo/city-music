class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.references :venue, null: false, foreign_key: true
      t.text :description
      t.float :price_min
      t.float :price_max
      t.string :source_url
      t.string :tickets_urls
      t.string :video_url

      t.timestamps
    end
  end
end
