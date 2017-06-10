class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :email
      t.string :password_digest
      t.string :token

      t.timestamps
    end
  end
end