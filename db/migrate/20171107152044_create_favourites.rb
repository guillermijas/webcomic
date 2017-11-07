class CreateFavourites < ActiveRecord::Migration[5.1]
  def change
    create_table :favourites do |t|
      t.belongs_to :user
      t.belongs_to :comic

      t.timestamps
    end
  end
end
