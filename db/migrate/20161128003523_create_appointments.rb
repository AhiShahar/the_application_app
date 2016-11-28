class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :start_time
      t.integer :professional_id
      t.integer :appointment_type_id
      t.integer :category

      t.timestamps null: false
    end
  end
end
