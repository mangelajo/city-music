class AddBandToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :band, null: true, foreign_key: true
  end
end
