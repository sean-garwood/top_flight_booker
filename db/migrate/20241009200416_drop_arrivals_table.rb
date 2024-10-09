class DropArrivalsTable < ActiveRecord::Migration[7.2]
  def change
    drop_table :arrivals do
    end
  end
end
