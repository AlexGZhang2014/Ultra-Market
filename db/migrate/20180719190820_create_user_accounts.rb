class CreateUserAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :user_accounts do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :merchant_id
      t.integer :client_id

      t.timestamps
    end
  end
end
