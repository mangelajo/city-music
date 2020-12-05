class CreateEventDates < ActiveRecord::Migration[6.0]
  def change
    create_table :event_dates do |t|
      t.references :event, null: false, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
