require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:image_url].any?
    assert product.errors[:price].any?
  end

  test "product price must be positive" do
    product = Product.new(title:
                            "My Book Title",
                          description: "yyy",
                          image_url:
                            "zzz.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0"],
                 product.errors[:price]
    product.price = 0
    assert product.valid?
    product.price = 1
    assert product.valid?
  end

  test "product name should be unique" do
    product_with_non_unique_name = Product.new(title: products(:ruby).title, description: 'abc', price: 5, image_url: 'abc.jpg' )

    assert product_with_non_unique_name.invalid?

    assert_equal ["has already been taken"], product_with_non_unique_name.errors[:title]
  end

  test "image url" do
    good_ones = %w("abc.jpg abc.gif abc.png")
    bad_ones = %w("abc.doc abc.exe abc.rb")

    good_ones.each { |good_one| assert get_product(image_url: good_one).valid? }
    bad_ones.each { |bad_one| assert get_product(image_url: bad_one).invalid? }
  end

  private

  def get_product(image_url:)
    Product.new(title: "abc", description: "abc", price: 5, image_url: image_url)
  end
end
