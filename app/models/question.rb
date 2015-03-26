class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes
  
  validates_presence_of :question_title
  validates_presence_of :question_content
end
