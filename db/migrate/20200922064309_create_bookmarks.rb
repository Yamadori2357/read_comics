class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.integer :user_id
      t.integer :comic_id

      t.timestamps
      
      t.index :user_id
      t.index :comic_id
      t.index [:user_id, :comic_id], unique: true
    end
  end
end
