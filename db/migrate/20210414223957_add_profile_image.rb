class AddProfileImage < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :profile_image
    end
  end
end
