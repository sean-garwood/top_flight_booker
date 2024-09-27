class CreateArrivals < ActiveRecord::Migration[7.2]
  def change
    create_table :arrivals do |t|
      t.references :flight, null: false, foreign_key: true
      t.references :airport, null: false, foreign_key: true

      t.timestamps
    end
  end
end
