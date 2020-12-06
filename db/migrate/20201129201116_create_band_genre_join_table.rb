class CreateBandGenreJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :bands, :genres do |t|
      # t.index [:band_id, :genre_id]
      t.index [:genre_id, :band_id], unique: true
    end
  end
end
