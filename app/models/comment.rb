class Comment < ActiveRecord::Base
  validates_presence_of :comment_content
  belongs_to :question
  belongs_to :user


end
