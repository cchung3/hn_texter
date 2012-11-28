class Texter

  require 'twilio-ruby'

  class << self
    def send(twilio_safe_number, link)

      account_sid = ENV["TWILIO_ACCOUNT_SID"]
      auth_token = ENV["TWILIO_AUTH_TOKEN"]
      sender_number = ENV["TWILIO_NUMBER"]
      client = Twilio::REST::Client.new account_sid, auth_token

      from = "+#{sender_number}" # Your Twilio number
      body = "Your link is on HN! (#{link})}".first(140)
      client.account.sms.messages.create(
        :from => from,
        :to => twilio_safe_number,
        :body => body
      )
    end
    
    
  end




end