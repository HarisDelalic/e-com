class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.shipped.subject
  #
  def shipped(order)
    @order = order

    mail from: 'no-reply@depot.com', to: order.email, subject: 'Order for your Pragmatic Cart is shipped'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
  def received(order)
    @order = order

    mail from: 'no-reply@depot.com', to: order.email, subject: 'Order for your Pragmatic Cart is received'
  end
end
