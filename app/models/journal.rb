# == Schema Information
#
# Table name: journals
#
#  id         :integer          not null, primary key
#  content    :text
#  date       :date
#  image      :string
#  mood       :string
#  title      :text
#  weather    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#
class Journal < ApplicationRecord
  belongs_to :author, required: true, class_name: "User", foreign_key: "author_id"
end
