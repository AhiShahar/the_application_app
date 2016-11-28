class CreateAppointmentTypes < ActiveRecord::Migration
  def change
    create_table :appointment_types do |t|
      t.string :name
      t.text :description
      t.float :price
      t.integer :duration
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
