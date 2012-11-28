class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :name, :password, :password_confirmation, :phone
  validates_uniqueness_of :email
  
  has_many :domains


  before_create { generate_token(:auth_token) }
  
  class << self
  
    def inform_all_with_link(link)
      all.each do |user|
        user.inform_if_has_link(link)
      end
    end
  end

  def inform_if_has_link(link)
    # links being passed in are in the form "google.com"
    if domains.map{|domain| normalize_link(domain.url) }.include?(normalize_link(link))
      inform(link)
    end
  end

  # Strip protocol, errant "/"s, www.
  def normalize_link(link)
    link.gsub(/(https:\/\/)|(http:\/\/)/, "")
      .gsub("/", "")
      .gsub("www.", "")
  end

  def inform(link)
    # begin
    puts "Twilio ing:"
      Texter.send(get_phone, link)
      puts "Mailing:"
      UserMailer.inform_user(self, link).deliver
    # rescue Exception => e
    # end
  end

  def get_phone
    phone.gsub(/\D/, "")
  end
  

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end