class CreatePublications < ActiveRecord::Migration[5.1]
  def change
    create_table :publications do |t|
      t.belongs_to :comic, foreign_key: true
      t.boolean :free
      t.integer :page
      t.text :comment

      t.timestamps
    end
  end
end
