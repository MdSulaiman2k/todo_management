class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :name, null: false
      t.text :email, null: false, unique: true
      t.text :password, null: false
    end
  end
end
