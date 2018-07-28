class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :image_url
      t.string :access_token
      t.text :profile

      t.timestamps
    end
  end
end