class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['BASIC_AUTH_NAME'], password: ENV['BASIC_AUTH_PASS']

  def show

    @product_count = Product.all.count

    @category_count = Category.all.count

  end
end
