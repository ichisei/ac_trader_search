class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.integer :trader_id, null: false
      t.date :compatible_date, null: false
      t.timestamps
    end
  end
end
