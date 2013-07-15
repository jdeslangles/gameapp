class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :username
      t.string :email
      t.text :bio
      t.string :user_picture
      t.string :user_gender

      t.timestamps
    end
  end
end
