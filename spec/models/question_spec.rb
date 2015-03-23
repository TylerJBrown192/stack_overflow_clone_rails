require 'rails_helper'

describe Question do
  it { should validate_presence_of :question_content }
  it { should validate_presence_of :question_title }

  it { should belong_to :user }
end
