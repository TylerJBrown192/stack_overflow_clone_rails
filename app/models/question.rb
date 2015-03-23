class Question < ActiveRecord::Base
  validates_presence_of :question_title
  validates_presence_of :question_content
  belongs_to :user
  has_many :comments
end
