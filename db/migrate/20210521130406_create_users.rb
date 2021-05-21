class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :user_name, null: false
      t.text :user_email, null: false, unique: true
      t.text :user_password, null: false
    end
  end
end
