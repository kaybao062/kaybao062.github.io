# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  link        :string
#  location    :string
#  name        :string
#  oh_link     :string
#  prof_email  :string
#  time        :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  homework_id :integer
#  student_id  :integer
#
class Course < ApplicationRecord
  belongs_to :student, required: true, class_name: "User", foreign_key: "student_id"
  has_many  :homeworks, class_name: "Homework", foreign_key: "course_id", dependent: :destroy
  has_many  :notes, class_name: "Note", foreign_key: "course_id", dependent: :destroy
end
