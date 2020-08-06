class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |x|
      x.string :name
      x.string :artist
      x.text :chords
      x.integer :user_id
    end
  end
end
