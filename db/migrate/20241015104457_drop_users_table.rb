class DropUsersTable < ActiveRecord::Migration[7.2]
  def up
    # Use raw SQL to drop the foreign key constraint
    execute <<-SQL
      PRAGMA foreign_keys = OFF;
      ALTER TABLE bookings DROP CONSTRAINT IF EXISTS fk_bookings_passenger_id;
      PRAGMA foreign_keys = ON;
    SQL

    # Drop the users table
    drop_table :users
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
