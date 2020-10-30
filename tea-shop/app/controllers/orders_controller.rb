class OrdersController < ApplicationController 
    post '/orders' do 
        # binding.pry
        @order = Order.create(params)
        session[:order_id] = @order.id

        redirect to '/success'
    end 

    get '/success' do
        @order = Order.find_by_id(session[:order_id])
        # @tea = Tea.all.find {|tea| tea.id == @order.tea_id}
        "Thank you, #{@order.name}. Your #{@order.tea.name} order has been placed."
    end 
end 