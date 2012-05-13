class CreateAccountUnits < ActiveRecord::Migration
  def change
    create_table :account_units do |t|
      t.string :name
      t.string :code
      t.string :morningstar_url

      t.timestamps
    end
  end
end
