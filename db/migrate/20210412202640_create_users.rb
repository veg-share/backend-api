class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :city
      t.string :zip_code
      t.string  :state

      
      t.timestamps
    end
  end
end
