class RemoveCompatibleMachineFromTraders < ActiveRecord::Migration[6.1]
  def change
    remove_column :traders, :compatible_machine, :boolean
  end
end
