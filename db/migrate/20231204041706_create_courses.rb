class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :link
      t.integer :homework_id
      t.string :oh_link
      t.string :prof_email
      t.string :location
      t.date :time
      t.integer :student_id

      t.timestamps
    end
  end
end
