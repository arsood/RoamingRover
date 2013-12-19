require 'test_helper'

# assuming that an empty User model will not pass validation
class UserTest < ActiveSupport::TestCase 
# vs
#class TestyThingy < MiniTest:Unit:TestCase 
test "user model must not be empty" do
  user = User.new
  assert user.invalid?
  assert user.errors[:id].any?
  assert user.errors[:email].any?
  assert user.errors[:phone].any?
  assert user.errors[:user_type].any?
  assert user.errors[:password].any?
  assert user.errors[:address].any?
  assert user.errors[:profile_pic].any?
  assert user.errors[:created_at].any?
  assert user.errors[:updated_at].any?
  assert user.errors[:first_name].any?
  assert user.errors[:last_name].any?
  assert user.errors[:availability].any?
  assert user.errors[:zipcode].any?
  assert user.errors[:password_salt].any?
end
end