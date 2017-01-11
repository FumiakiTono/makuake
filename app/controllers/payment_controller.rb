require "webpay"

class PaymentController < ApplicationController

  def pay
    # @project_user = Project_user.new(project_id: params[:project_id], user_id: params[:current_user_id])
    webpay = WebPay.new(ENV["webpay_secret_key"])

    if params[:customer_id] == ""
      customer = webpay.customer.create(card: params["webpay-token"])
      user = User.find(params[:current_user_id])
      user.customer_id = customer.id
      user.save
    else
      customer = webpay.customer.retrieve(params[:customer_id])
    end

    amount = 100

    webpay.charge.create(
      amount: amount,
      currency: "jpy",
      customer: customer.id
    )

    @project = Project.find(params[:project_id])
    if @project.currentprice == nil
      @project.currentprice = 0
      @project.currentprice += amount
      @project.save
    else
      @project.currentprice += amount
      @project.save
    end

    redirect_to :root
  end

end
