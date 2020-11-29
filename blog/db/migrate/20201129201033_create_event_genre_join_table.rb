class CreateEventGenreJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :events, :genres do |t|
      # t.index [:event_id, :genre_id]
      t.index [:genre_id, :event_id], unique: true
    end
  end
end
