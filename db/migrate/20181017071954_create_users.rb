class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.date :birthday
      t.string :gender
      t.string :phone
      t.string :address
      t.integer :role

      t.timestamps
    end
  end
end
