class CreateComics < ActiveRecord::Migration[5.1]
  def change
    create_table :comics do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.float :price
      t.string :category
      t.float :average_rating

      t.timestamps
    end
  end
end
