require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Order for your Pragmatic Cart is shipped", mail.subject
    assert_equal ["johndoe@example.com"], mail.to
    assert_equal ["no-reply@depot.com"], mail.from
    # assert_match "Hi", mail.body.encoded
  end

  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Order for your Pragmatic Cart is received", mail.subject
    assert_equal ["johndoe@example.com"], mail.to
    assert_equal ["no-reply@depot.com"], mail.from
    # assert_match "Hi", mail.body.encoded
  end

end
