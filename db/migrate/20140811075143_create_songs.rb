class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :image
      t.string :instrument
      t.string :category
      t.integer :user_id   
      # t.timestamps
    end
  end
end
