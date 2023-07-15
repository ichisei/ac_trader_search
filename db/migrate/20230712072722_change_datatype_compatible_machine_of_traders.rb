class ChangeDatatypeCompatibleMachineOfTraders < ActiveRecord::Migration[6.1]
  def change
    
    change_column :traders, :compatible_machine, :boolean
    
  end
end