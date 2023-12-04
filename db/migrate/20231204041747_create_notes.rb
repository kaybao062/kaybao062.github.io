class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.integer :course_id
      t.string :image
      t.integer :student_id
      t.string :title
      t.text :content
      t.text :questions

      t.timestamps
    end
  end
end
