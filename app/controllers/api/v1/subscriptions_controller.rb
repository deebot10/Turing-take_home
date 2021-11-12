class Api::V1::SubscriptionsController < ApplicationController

  def index
    customer = Customer.find(params["customer_id"])
    render json: SubscriptionSerializer.new(customer.subscriptions)  
  end

  def create
    subs = Subscription.new(sub_params)
    
    if subs.save
      render json: SubscriptionSerializer.new(subs), status: 201
    else
      render json: { error: 'Error in Subscription'}, status: 422 
    end
  end

  def update
    subs = Subscription.find(params[:id])
    updated_subs = subs.update(sub_params)

    if updated_subs == true
      render json: SubscriptionSerializer.new(subs), status: 200
    else
      render json: { error: 'Invalid Info'}, status: 400
    end
  end

  private
  def sub_params  
    params[:subscription].permit(:title, :price, :status, :frequency, :customer_id, :tea_id)  
  end
end