class CreateAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :areas do |t|
      t.string :compatible_area, null: false
      t.timestamps
    end
  end
end
