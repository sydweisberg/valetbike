require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  def test_welcome_email
    user = users(:some_user_in_your_fixtures)

    # Send the email, then test that it got queued
    email = UserMailer.welcome_email(user).deliver
    assert !ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal [user.email], email.to
    assert_equal "Welcome to ValetBike!", email.subject
    assert_match(/<h1>Welcome to ValetBike, #{user.first}!<\/h1>/, email.encoded)
  end
end
