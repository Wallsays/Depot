class StoreController < ApplicationController
  def index
    @count = increment_count
    @products = Product.order(:title)
    @cart = current_cart
  end
end
