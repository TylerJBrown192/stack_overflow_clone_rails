require 'rails_helper'

describe User do
  it { should have_many :questions }
  it { should have_many :comments }
  it { should validate_presence_of :user_name }
  it { should validate_presence_of :email }
  it { should validate_confirmation_of :password }
end
