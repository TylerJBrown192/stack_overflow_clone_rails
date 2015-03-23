FactoryGirl.define do
  factory(:user) do
    user_name('John Smith')
    user_email('johnnyboy@gmail.com')
    password('johnnybravo1234')
  end

  factory(:question) do
    question_content('How do I type?')
    question_title('Type?!?!')
    user_id(1)
  end

  factory(:comment) do
    comment_content('This post sucks!')
    question_id(1)
  end
end
