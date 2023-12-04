# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  content    :text
#  image      :string
#  questions  :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :integer
#  student_id :integer
#
class Note < ApplicationRecord
  belongs_to :author, required: true, class_name: "User", foreign_key: "student_id"
  belongs_to :course, required: true, class_name: "Course", foreign_key: "course_id"
end
