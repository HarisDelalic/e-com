class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  validates :name, :address, :email, presence: true
  # validates :pay_type, inclusion: pay_types.keys

  enum pay_types: {
    "Check" => 0,
    "Credit card" => 1,
    "Purchase order" => 2
  }

  def add_line_items_from_cart(cart)
    cart.line_items.each do |line_item|
      line_item.cart_id = nil
      line_items << line_item
    end
  end

  def charge! pay_type_params
    pago_charge = Pago.new(order_id: id, payment_methods: Order.pay_types.key(pay_type), payment_details: pay_type_params)

    if pago_charge.make_payment.succeeded?
      OrderMailer.received(self ).deliver_later
    end
  end
end
