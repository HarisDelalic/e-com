require "test_helper"

class SupportMailboxTest < ActionMailbox::TestCase
  test "receive mail basic" do
    receive_inbound_email_from_mail \
      to: '"support" <support@example.com>',
      from: 'dela@dela.com',
      subject: "Test Subject",
      body: "Test Body"

    last_support_request = SupportRequest.last
    assert_equal "dela@dela.com", last_support_request.email
    assert_equal "Test Subject", last_support_request.subject
    assert_equal "Test Body", last_support_request.body
    assert_nil last_support_request.order
  end

  test "receive mail when sender has order" do
    recent_order = orders(:one)
    older_order = orders(:another_one)
    other_customer = orders(:other_customer)

    receive_inbound_email_from_mail \
      to: '"support" <support@example.com>',
      from: recent_order.email,
      subject: "Test Subject",
      body: "Test Body"

    last_support_request = SupportRequest.last
    assert_not_nil last_support_request.order
    assert_equal recent_order, last_support_request.order
  end
end
