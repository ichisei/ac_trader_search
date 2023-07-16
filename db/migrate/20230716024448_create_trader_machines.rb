class CreateTraderMachines < ActiveRecord::Migration[6.1]
  def change
    create_table :trader_machines do |t|
      t.integer :trader_id
      t.integer :machine_id

      t.timestamps
    end
  end
end
