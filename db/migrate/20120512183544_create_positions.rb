class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.references :user
      t.references :support, :polymorphic
      t.float :buy_price
      t.float :sell_price
      t.float :price_paid
      t.datetime :buy_date
      t.datetime :sell_date

      t.timestamps
    end
    add_index :positions, :user_id
    add_index :positions, :support_id
  end
end
