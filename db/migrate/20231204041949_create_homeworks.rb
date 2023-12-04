class CreateHomeworks < ActiveRecord::Migration[7.0]
  def change
    create_table :homeworks do |t|
      t.integer :course_id
      t.datetime :due_date
      t.integer :estimated_time
      t.string :file_path
      t.text :instruction
      t.string :questions
      t.integer :student_id
      t.string :progress

      t.timestamps
    end
  end
end
