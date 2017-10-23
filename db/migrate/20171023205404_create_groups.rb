class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.belongs_to :forum, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
