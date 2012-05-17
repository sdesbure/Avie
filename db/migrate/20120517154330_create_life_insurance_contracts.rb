class CreateLifeInsuranceContracts < ActiveRecord::Migration
  def change
    create_table :life_insurance_contracts do |t|
      t.references :life_insurance
      t.references :user
      t.string :contract_number

      t.timestamps
    end
    add_index :life_insurance_contracts, :life_insurance_id
    add_index :life_insurance_contracts, :user_id
  end
end
