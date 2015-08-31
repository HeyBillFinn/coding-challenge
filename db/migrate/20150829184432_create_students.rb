class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :email_address
      t.string :unique_hash

      t.timestamps null: false
    end
  end
end
