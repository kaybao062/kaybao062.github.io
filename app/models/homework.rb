# == Schema Information
#
# Table name: homeworks
#
#  id             :integer          not null, primary key
#  due_date       :datetime
#  estimated_time :integer
#  file_path      :string
#  instruction    :text
#  progress       :string
#  questions      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  course_id      :integer
#  student_id     :integer
#
class Homework < ApplicationRecord
  belongs_to :student, required: true, class_name: "User", foreign_key: "student_id"
  belongs_to :course, required: true, class_name: "Course", foreign_key: "course_id"
end
