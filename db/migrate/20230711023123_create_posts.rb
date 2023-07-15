class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :customer_id, null: false
      t.integer :trader_id, null: false
      t.string :rating
      t.text :comment, null: false
      t.timestamps
    end
  end
end
