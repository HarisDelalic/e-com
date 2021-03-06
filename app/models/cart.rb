class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product)
    current_item = LineItem.find_by(product_id: product.id, cart_id: self.id )

    if current_item
      current_item.quantity += 1
      current_item.price = product.price
    else
      current_item = line_items.build(product_id: product.id, cart_id: self.id, price: product.price)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum {|line_item| line_item.total_price}
  end
end
