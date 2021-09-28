class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.datetime :start_time
      t.integer :number_of_people
      t.references :customer, null: false, foreign_key: true
      t.references :table, null: false, foreign_key: true

      t.timestamps
    end
  end
end
