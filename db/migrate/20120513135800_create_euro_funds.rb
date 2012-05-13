class CreateEuroFunds < ActiveRecord::Migration
  def change
    create_table :euro_funds do |t|
      t.string :name

      t.timestamps
    end
  end
end
