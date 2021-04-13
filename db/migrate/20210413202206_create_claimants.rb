
class CreateClaimants < ActiveRecord::Migration[5.2]
  def change
    create_table :claimants do |t|
      t.references :post, foreign_key: true
      t.references :claimant, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
