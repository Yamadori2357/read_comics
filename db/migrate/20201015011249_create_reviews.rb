class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :comic_id
      t.integer :score
      t.string  :content

      t.timestamps
      
      t.index :user_id
      t.index :comic_id
      t.index [:user_id, :comic_id], unique: true
    end
  end
end
