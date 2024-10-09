class DropDeparturesTable < ActiveRecord::Migration[7.2]
  def change
    reversible do |dir|
      dir.up do
        drop_table :departures
      end

      dir.down do
        create_table :departures, force: :cascade do |t|
          t.integer :flight_id, null: false
          t.integer :airport_id, null: false
          t.datetime :created_at, null: false
          t.datetime :updated_at, null: false
        end
      end
    end
  end
end
