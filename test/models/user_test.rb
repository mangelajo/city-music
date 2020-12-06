require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "that first user will be admin" do
    User.delete_all
    user = User.new(password:'mypass', email: 'my@email.com')
    user.save!
    assert user.admin?, "The first user must be administrator"

    user2 = User.new(password:'mypass', email: 'my2@email.com')
    user2.save!
    assert_not user2.admin?, "The second user must not be administrator"
  end
end
