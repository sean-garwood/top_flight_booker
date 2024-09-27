class CreateDepartures < ActiveRecord::Migration[7.2]
  def change
    create_table :departures do |t|
      t.references :flight, null: false, foreign_key: true
      t.references :airport, null: false, foreign_key: true

      t.timestamps
    end
  end
end
