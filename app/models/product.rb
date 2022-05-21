class Product < ApplicationRecord
  validates :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :title, uniqueness: true, presence: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)}i,
    message: 'must be URL for GIF, JPG or PNG'
  }
end
