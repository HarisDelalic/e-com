class Pago
  attr_accessor :order_id, :payment_methods, :payment_details

  def initialize(order_id:, payment_methods:, payment_details:)
    @order_id = order_id
    @payment_methods = payment_methods
    @payment_details = payment_details
  end

  def make_payment
    case payment_methods
    when 'Check'
      Rails.logger.info "Processing check: " +
                          payment_details.fetch(:routing_number).to_s + "/" +
                          payment_details.fetch(:account_number).to_s
    when 'Credit card'
      Rails.logger.info "Processing credit_card: " +
                          payment_details.fetch(:cc_num).to_s + "/" +
                          payment_details.fetch(:expiration_date).to_s
    when 'Purchase order'
      Rails.logger.info "Processing purchase order: " +
                          payment_details.fetch(:po_number).to_s
    else
      raise "Unknown payment_method #{payment_methods}"
    end
    sleep 3 unless Rails.env.test?
    Rails.logger.info "Done Processing Payment"
    OpenStruct.new(succeeded?: true)
  end
end