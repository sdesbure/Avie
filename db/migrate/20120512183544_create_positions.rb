class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.references :user
      t.references :support, :polymorphic => {:default => 'AccountUnit'}
      t.references :life_insurance_contract
      t.float :buy_price
      t.float :sell_price
      t.float :price_paid
      t.date :buy_date
      t.date :sell_date

      t.timestamps
    end
    add_index :positions, :user_id
    add_index :positions, :support_id
    add_index :positions, :life_insurance_contract_id
  end
end
