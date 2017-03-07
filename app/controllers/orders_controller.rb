class OrdersController < ApplicationController
	# before_action :authenticate_user!
	# before_filter :set_default_response_format

	def create
		order = Order.new(order_params)
		ActiveRecord::Base.transaction do
			if order.save
				bill_amount = 0
				params[:orders][:line_items_attributes].each do |line_item|
					product = Product.find(line_item["product_id"])
					product.update_attributes(:stock_count => (product.stock_count-line_item["quantity"]))
					bill_amount +=line_item["price"]
				end
				order.update_attributes(:bill_amount => bill_amount)
				data = {:message => "Order placed successfuly"}
        		render json: data, status: :ok        
			else
				data = {:message => "Order could not placed"}
				render json: data, status: :unprocessable_entity
			end
		end
	end

	private
		# def set_default_response_format
	 #    	request.format = :json
	 #    end

		def order_params
			params.require(:orders).permit(:state, :bill_amount, :user_id, :line_items_attributes => [:id,:product_id, :quantity, :price, :order_id ])
		end
end