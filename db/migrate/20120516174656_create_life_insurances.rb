class CreateLifeInsurances < ActiveRecord::Migration
  def change
    create_table :life_insurances do |t|
      t.references :broker
      t.references :insurer
      t.string :name
      t.string :website

      t.timestamps
    end
    add_index :life_insurances, :broker_id
    add_index :life_insurances, :insurer_id
  end
end
