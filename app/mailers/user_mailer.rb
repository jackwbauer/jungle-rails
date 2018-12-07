class UserMailer < ApplicationMailer

    default from: 'noreply@jungle.com'  

    def order_confirmation(order)
        @order = order[:order]
        @cart = order[:cart]
        mail(to: 'bauer.jackw@gmail.com', subject: `Order ##{order[:id]} Confirmation`)
    end
end
