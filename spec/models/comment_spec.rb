require 'rails_helper'

describe Comment do
  it { should validate_presence_of :comment_content }

  it { should belong_to :question }
end
