class InitDatabase < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.date :premium_until

      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true

    create_table :comics do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.float :price
      t.string :category
      t.float :average_rating

      t.timestamps
    end

    create_table :ratings do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :comic, foreign_key: true
      t.integer :rating
      t.string :description

      t.timestamps
    end

    create_table :publications do |t|
      t.belongs_to :comic, foreign_key: true
      t.boolean :free
      t.integer :page
      t.text :comment

      t.timestamps
    end

    create_table :payments do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :comic, foreign_key: true

      t.timestamps
    end

    create_table :forums do |t|
      t.belongs_to :comic, foreign_key: true
      t.string :topic

      t.timestamps
    end

    create_table :groups do |t|
      t.belongs_to :forum, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end

    create_table :comments do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :group, foreign_key: true
      t.text :body

      t.timestamps
    end

  end
end


