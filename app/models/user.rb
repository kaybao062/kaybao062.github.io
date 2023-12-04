# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  enroll_date   :date
#  graduate_date :date
#  name          :string
#  password      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  cnet_id       :integer
#
class User < ApplicationRecord
  has_many  :notes, class_name: "Note", foreign_key: "student_id", dependent: :destroy
  has_many  :homeworks, class_name: "Homework", foreign_key: "student_id", dependent: :destroy
  has_many  :courses, class_name: "Course", foreign_key: "student_id", dependent: :destroy
  has_many  :journals, class_name: "Journal", foreign_key: "author_id", dependent: :destroy
end
