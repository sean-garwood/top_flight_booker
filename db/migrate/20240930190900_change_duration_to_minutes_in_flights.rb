class ChangeDurationToMinutesInFlights < ActiveRecord::Migration[7.2]
  def change
    change_column :flights, :duration, :integer
  end
end
