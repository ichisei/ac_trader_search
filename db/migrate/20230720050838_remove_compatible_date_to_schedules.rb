class RemoveCompatibleDateToSchedules < ActiveRecord::Migration[6.1]
  def change
    remove_column :schedules, :compatible_date
  end
end
