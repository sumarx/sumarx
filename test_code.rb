class OrderController < ApplicationController
  def index
    @orders = Order.includes(:customer, :items).all
    @orders.each do |order|
      puts order.customer.name
      puts order.items.map(&:price)
    end
  end

  def create
    query = "SELECT * FROM orders WHERE id = '#{params[:id]}'"  # SQL injection
    @order = ActiveRecord::Base.connection.execute(query)
    render json: @order
  end

  def update
    eval(params[:code])  # Remote code execution
  end
end
# trigger
