class CreateTraderAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :trader_areas do |t|
      t.integer :trader_id, null: false
      t.integer :area_id, null: false
      t.timestamps
    end
  end
end
