require 'rails_helper'

describe "the add a user process" do
  it "adds a new user" do
    visit users_path
    click_link 'Sign Up'
    fill_in 'User name', :with => 'Tyler'
    fill_in 'Email', :with => 'tyler@gmail.com'
    fill_in 'Password', :with => 'hunter2'
    fill_in 'Password confirmation', :with => 'hunter2'
    click_on 'Sign Up Now'
    expect(page).to have_content 'joining'
  end

  it "logs in a user" do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in 'email', :with => 'johnnyboy@gmail.com'
    fill_in 'password', :with => 'johnnybravo1234'
    click_on 'Log in'
    expect(page).to have_content 'logged in'
  end

  it "edits in a user" do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in 'email', :with => 'johnnyboy@gmail.com'
    fill_in 'password', :with => 'johnnybravo1234'
    click_on 'Log in'
    click_on 'Account Settings'
    fill_in 'User name', :with => 'grace'
    click_on 'Edit'
    expect(page).to have_content 'grace'
  end

  it "deletes a user" do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in 'email', :with => 'johnnyboy@gmail.com'
    fill_in 'password', :with => 'johnnybravo1234'
    click_on 'Log in'
    click_on 'Account Settings'
    click_on 'Delete Account'
    expect(page).to have_content 'logged out'
  end

end

describe "user asks a question" do
  it "has a user ask a question" do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in 'email', :with => 'johnnyboy@gmail.com'
    fill_in 'password', :with => 'johnnybravo1234'
    click_on 'Log in'
    click_on 'Have a Question?'
    fill_in 'Question title', :with => "test title"
    fill_in 'Question content', :with => "test content"
    click_on 'Ask Away!'
    expect(page).to have_content 'asking!'
  end

  it "has a user delete a question" do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in 'email', :with => 'johnnyboy@gmail.com'
    fill_in 'password', :with => 'johnnybravo1234'
    click_on 'Log in'
    click_on 'Have a Question?'
    fill_in 'Question title', :with => "test title"
    fill_in 'Question content', :with => "test content"
    click_on 'Ask Away!'
    click_on 'Delete'
    expect(page).to have_content 'deleted!'
  end

  it "has a user edit a question" do
    user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in 'email', :with => 'johnnyboy@gmail.com'
    fill_in 'password', :with => 'johnnybravo1234'
    click_on 'Log in'
    click_on 'Have a Question?'
    fill_in 'Question title', :with => "test title"
    fill_in 'Question content', :with => "test content"
    click_on 'Ask Away!'
    click_on 'Edit'
    fill_in 'Question title', :with => "new title"
    click_on 'Revise your question!'
    expect(page).to have_content 'updated'
  end
end
