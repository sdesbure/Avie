class CreateInsurers < ActiveRecord::Migration
  def change
    create_table :insurers do |t|
      t.string :name
      t.string :website

      t.timestamps
    end
  end
end
