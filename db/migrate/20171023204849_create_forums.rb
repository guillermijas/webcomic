class CreateForums < ActiveRecord::Migration[5.1]
  def change
    create_table :forums do |t|
      t.belongs_to :comic, foreign_key: true
      t.string :topic

      t.timestamps
    end
  end
end
