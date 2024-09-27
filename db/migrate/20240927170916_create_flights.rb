class CreateFlights < ActiveRecord::Migration[7.2]
  def change
    create_table :flights do |t|
      t.datetime :depart_time
      t.time :duration

      t.timestamps
    end
  end
end
