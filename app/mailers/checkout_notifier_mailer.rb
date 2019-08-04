class CheckoutNotifierMailer < ApplicationMailer
  default :from => 'atchyutnagabhairava@gmail.com'
  
  def payment_confirmation(order)
    @order  = order
    @user   = order.user
    @url    = "#{Rails.configuration.host}/orders/#{order.id}"
    mail(
      to:       @user.email,
      subject:  "Payment Confirmation - Digital Shop"
    )
  end
end
