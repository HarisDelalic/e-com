require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include AuthenticationHelpers
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
end
