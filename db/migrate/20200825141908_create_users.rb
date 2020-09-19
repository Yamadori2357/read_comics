class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :unique_name
      t.string  :email
      t.string  :self_instoduction
      t.string  :profile_image
      t.string  :header_image
      t.date    :birth_date
      t.timestamps
    end
  end
end
