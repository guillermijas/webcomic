class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :comic, foreign_key: true

      t.timestamps
    end
  end
end
