class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.text :password_digest
      t.text :image
      t.boolean :is_professional, default: false
      t.string :profession

      t.timestamps null: false
    end
  end
end
