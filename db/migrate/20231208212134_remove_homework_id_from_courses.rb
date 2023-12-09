class RemoveHomeworkIdFromCourses < ActiveRecord::Migration[7.0]
  def change
    remove_column :courses, :homework_id
  end
end
