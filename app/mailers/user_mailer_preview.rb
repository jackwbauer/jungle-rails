
class UserMailerPreview < ActionMailer::Preview
    def welcome_email
      UserMailer.order_confirmation(user: User.first)
    end
  end