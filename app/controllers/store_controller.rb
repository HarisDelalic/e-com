class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  skip_before_action :authorize


  def index
    if params[:set_locale].present?
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.all.order(:title)
    end
  end
end
