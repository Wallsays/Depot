class StoreController < ApplicationController
  skip_before_filter :authorize

  def index
    @count = increment_count
    @products = Product.order(:title)
    @cart = current_cart
  end
end
