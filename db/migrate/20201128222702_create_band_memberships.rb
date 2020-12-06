class CreateBandMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :band_memberships do |t|
      t.references :band, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :active

      t.timestamps
    end
  end
end
