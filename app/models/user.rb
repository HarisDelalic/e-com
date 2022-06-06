class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, uniqueness: true
  after_destroy :ensure_at_least_one_user_exist

  class Error < StandardError
    def initialize(msg = nil)
      super 'Last User Can\'t be deleted'
    end
  end

  private

  def ensure_at_least_one_user_exist
    if User.count.zero?
      raise Error.new
    end
  end
end
