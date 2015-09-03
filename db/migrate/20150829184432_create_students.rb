class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :email_address

      t.timestamps null: false
    end

    create_table :exercises do |t|
      t.belongs_to :student, index: true
      t.string :state
      t.string :language
      t.text :exercise_response

      t.timestamps null: false
    end
  end
end
