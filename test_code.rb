class OrderController < ApplicationController
  def index
    @orders = Order.all
    @orders.each do |order|
      puts order.customer.name        # N+1 query
      puts order.items.map(&:price)   # Another N+1
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
