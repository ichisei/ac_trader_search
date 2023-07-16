class CreateMachines < ActiveRecord::Migration[6.1]
  def change
    create_table :machines do |t|
      t.string :possible_machine

      t.timestamps
    end
  end
end
