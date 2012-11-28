class UserMailer < ActionMailer::Base
  default from: SITE_EMAIL

  def contact_us(message)
    @name = message.name
    @email = message.email
    @body = message.body
    mail(to: SITE_EMAIL,
         subject: "Contact us!")
  end

  def inform_user(user, link)
    @link = link
    mail(to: user.email,
          subject: "Your site is on HN!")
  end

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end


  private

  def emails(str)
    SITE_EMAIL + ", #{str}"
  end

end