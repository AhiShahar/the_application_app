class CreateWorkRelations < ActiveRecord::Migration
  def change
    create_table :work_relations do |t|
      t.integer :customer_id
      t.integer :professional_id
      t.boolean :approved, :default => false
      t.string :status

      t.timestamps null: false
    end
  end
end
