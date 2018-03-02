class OrderMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_email(order_info)
    @order_info = order_info

    # variable for accessing order id
    mail(to: @order_info.email, subject: "hhhhhh")
  end
end
