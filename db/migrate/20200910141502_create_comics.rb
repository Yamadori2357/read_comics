class CreateComics < ActiveRecord::Migration[6.0]
  def change
    create_table :comics do |t|
      t.string :title
      t.string :cover_image
      t.string :author_name
      t.string :content
      t.string :genre

      t.timestamps
    end
  end
end
