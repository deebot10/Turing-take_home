class Api::V1::CustomersController < ApplicationController

  def show
    customer = Customer.find(params[:id]) 
    render json: CustomerSerializer.new(customer) 
  end
  
  def create
    customer = Customer.new(customer_params)
    
    if customer.save
      render json: CustomerSerializer.new(customer), status: 201      
    else
      render json: {
        message: 'Invalid',
        errors: item.errors.map { |_attr, msg| msg }
      }, status: :bad_request
    end
  end

   def customer_params
    params.permit(:first_name, :last_name, :email, :address)
  end
end