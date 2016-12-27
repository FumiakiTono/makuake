require "webpay"

class PaymentController < ApplicationController

  def pay
    webpay = WebPay.new(ENV["webpay_secret_key"])

    if params[:customer_id] == ""
      customer = webpay.customer.create(card: params["webpay-token"])
      user = User.find(params[:current_user_id])
      user.customer_id = customer.id
      user.save
    else
      customer = webpay.customer.retrieve(params[:customer_id])
    end

    webpay.charge.create(
      amount: 100,
      currency: "jpy",
      customer: customer.id
    )

    redirect_to :root
  end

end
